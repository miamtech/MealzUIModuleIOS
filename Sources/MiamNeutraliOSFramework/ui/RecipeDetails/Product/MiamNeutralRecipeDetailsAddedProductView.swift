//
//  MiamNeutralRecipeDetailsAddedProductView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsAddedProductView: RecipeDetailsAddedProductProtocol {
    public init() {}
    let dim = Dimension.sharedInstance
    
    public func content(
        data: RecipeProductData,
        onDeleteProduct: @escaping () -> Void,
        onChangeProduct: @escaping () -> Void,
        updateProductQuantity: @escaping (Int) -> Void
    ) -> some View {
        VStack {
            HStack {
                Text(data.ingredientName.capitalizingFirstLetter()).padding(dim.mPadding).miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                Spacer()
                if let ingredientQuantity = data.ingredientQuantity, let qty = Float(ingredientQuantity), let unit = data.ingredientUnit {
                    Text(String(format: "%g \(unit)", qty))
                        .padding(dim.mPadding)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                }
            }
            .foregroundColor(Color.mealzColor(.white))
            .frame(height: 40)
            .background(Color.mealzColor(.primary))
            .cornerRadius(dim.mCornerRadius, corners: .top)
            
            HStack {
                if let pictureURL = URL(string: data.pictureURL) {
                    AnyView(AsyncImage(url: pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }).frame(width: 72, height: 72)
                        .padding(dim.mPadding)
                }
                
                VStack(alignment: .leading) {
                    if let brand = data.brand {
                        Text(brand)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallBoldStyle)
                    }
                    Text(data.name)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                    Text(data.capacity)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                        .foregroundColor(Color.mealzColor(.standardDarkText))
                        .padding(dim.mPadding)
                        .background(Capsule().fill(Color.mealzColor(.lightBackground)))
                    Button(action: onChangeProduct, label: {
                        Text(Localization.myBudget.replaceItem.localised)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                            .foregroundColor(Color.mealzColor(.primary))
                    })
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
            }
            HStack {
                Text(data.formattedProductPrice)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                    .padding(.horizontal, 12)
                    .foregroundColor(Color.mealzColor(.primary))
                Spacer()
                HStack{
                    Button {
                        if data.productQuantity == 1 {
                            onDeleteProduct()
                        } else {
                            updateProductQuantity(data.productQuantity - 1)
                        }
                    } label: {
                        Image.mealzIcon(icon: .minus)
                            .renderingMode(.template)
                            .foregroundColor(Color.mealzColor(.primary))
                    }
                    Text(String(data.productQuantity)).frame(minWidth: 10, alignment: .center)
                    Button {
                        updateProductQuantity(data.productQuantity + 1)
                    } label: {
                        Image.mealzIcon(icon: .plus)
                            .renderingMode(.template)
                            .foregroundColor(Color.mealzColor(.primary))
                    }
                }
                .padding(dim.mPadding)
            }
            if data.numberOfOtherRecipesSharingThisIngredient > 1 {
                HStack(alignment: .center) {
                    Text(
                        String(format: String.localizedStringWithFormat(
                            Localization.ingredient.productsSharedRecipe(
                                numberOfProducts: Int32(data.numberOfOtherRecipesSharingThisIngredient)
                            ).localised,
                            data.numberOfOtherRecipesSharingThisIngredient),
                            data.numberOfOtherRecipesSharingThisIngredient)
                    )
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                    .foregroundColor(Color.mealzColor(.grayText))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, Dimension.sharedInstance.mPadding)
                .background(Color.mealzColor(.lightBackground))
            }
        }.overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: dim.mCornerRadius)
                .stroke(Color.mealzColor(.primary), lineWidth: 1)
        )
        .padding(.horizontal, dim.mPadding)
    }
}
