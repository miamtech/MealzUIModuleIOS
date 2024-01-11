//
//  MiamNeutralRecipeDetailsUnaddedProductView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsUnaddedProductView: RecipeDetailsUnaddedProductProtocol {
    public init() {}
    let dim = Dimension.sharedInstance
    public func content(data: RecipeProductData, onAddProduct: @escaping () -> Void, onIgnoreProduct: @escaping () -> Void, onChooseProduct: @escaping () -> Void) -> some View {
        VStack {
            HStack {
                Text(data.ingredientName.capitalizingFirstLetter()).padding(dim.mPadding).miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                Spacer()
                Text(String(format: "%g \(data.productUnit)", data.productQuantity))
                    .padding(dim.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                
            }
            .foregroundColor(Color.mealzColor(.darkestGray))
            .frame(height: 40)
            .background(Color.mealzColor(.lightBackground))
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
                    Text(data.description)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                        .padding(dim.mPadding)
                        .background(Capsule().fill(Color.mealzColor(.lightBackground)))
                    Button(action: onChooseProduct, label: {
                        Text(Localization.myBudget.replaceItem.localised)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                            .foregroundColor(Color.mealzColor(.primary))
                    })
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
            }
            HStack {
                Text(data.formattedProductPrice)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                    .padding(.horizontal, dim.mlPadding)
                    .foregroundColor(Color.mealzColor(.primary))
                Spacer()
                Button(action: onIgnoreProduct, label: {
                    Text(Localization.ingredient.ignoreProduct.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                        .foregroundColor(Color.mealzColor(.darkGray))
                })
                Button(action: onAddProduct, label: {
                    Image.mealzIcon(icon: .basket)
                        .padding(dim.lPadding)
                        .background(Color.mealzColor(.primary).cornerRadius(dim.mPadding))
                        .frame(width: 48, height: 48)
                })
                .padding(dim.mlPadding)
            }
        }.overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: dim.mCornerRadius)
                .stroke(Color.mealzColor(.lightBackground), lineWidth: 1)
        )
        .padding(.horizontal, dim.mPadding)
    }
}
