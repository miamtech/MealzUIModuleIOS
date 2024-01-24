//
//  MealzRecipeDetailsAddedProductView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework
import miamCore

public let mealzProductHeight: CGFloat = 230

@available(iOS 14, *)
public struct MealzRecipeDetailsAddedProductView: RecipeDetailsAddedProductProtocol {
    public init() {}
    let dim = Dimension.sharedInstance
    public func content(params: RecipeDetailsAddedProductParameters) -> some View {
        VStack {
            HStack {
                Text(params.data.ingredientName.capitalizingFirstLetter())
                    .padding(dim.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                Spacer()
                if let unit = params.data.ingredientUnit {
                    Text(QuantityFormatter.companion.readableFloatNumber(value: params.data.ingredientQuantity, unit: unit))
                        .padding(dim.mPadding)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                }
            }
            .foregroundColor(Color.mealzColor(.white))
            .frame(height: 40)
            .background(Color.mealzColor(.primary))
            .cornerRadius(dim.mCornerRadius, corners: .top)
            HStack {
                if let pictureURL = URL(string: params.data.pictureURL) {
                    AsyncImage(url: pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .frame(width: 72, height: 72)
                    .padding(dim.mPadding)
                }
                
                VStack(alignment: .leading) {
                    if let brand = params.data.brand {
                        Text(brand)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallBoldStyle)
                    }
                    Text(params.data.name)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                    HStack {
                        IngredientUnitBubble(capacity: params.data.capacity)
                        if params.data.isSponsored {
                            MealzSponsoredTag()
                        }
                    }
                    Button(action: params.onChangeProduct, label: {
                        Text(Localization.myBudget.replaceItem.localised)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                            .foregroundColor(Color.mealzColor(.primary))
                    })
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal, dim.mlPadding)
                .padding(.top, dim.mPadding)
            }
            HStack {
                Text(params.data.formattedProductPrice)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                    .padding(.horizontal, 12)
                    .foregroundColor(Color.mealzColor(.primary))
                Spacer()
                HStack{
                    Button {
                        if params.data.productQuantity == 1 {
                            params.onDeleteProduct()
                        } else {
                            params.updateProductQuantity(params.data.productQuantity - 1)
                        }
                    } label: {
                        Image.mealzIcon(icon: .minus)
                            .renderingMode(.template)
                            .foregroundColor(Color.mealzColor(.primary))
                    }
                    if params.updatingQuantity {
                        ProgressLoader(color: Color.mealzColor(.standardDarkText), size: 10)
                    } else {
                        Text(String(params.data.productQuantity)).frame(minWidth: 10, alignment: .center)
                    }
                    Button {
                        params.updateProductQuantity(params.data.productQuantity + 1)
                    } label: {
                        Image.mealzIcon(icon: .plus)
                            .renderingMode(.template)
                            .foregroundColor(Color.mealzColor(.primary))
                    }
                }
                .padding(dim.mPadding)
            }
            Spacer()
            if params.data.numberOfOtherRecipesSharingThisIngredient > 1 {
                HStack(alignment: .center) {
                    Text(
                        String(format: String.localizedStringWithFormat(
                            Localization.ingredient.productsSharedRecipe(
                                numberOfProducts: Int32(params.data.numberOfOtherRecipesSharingThisIngredient)
                            ).localised,
                            params.data.numberOfOtherRecipesSharingThisIngredient),
                               params.data.numberOfOtherRecipesSharingThisIngredient)
                    )
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                    .foregroundColor(Color.mealzColor(.grayText))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, Dimension.sharedInstance.mPadding)
                .background(Color.mealzColor(.lightBackground))
            }
        }
        .frame(height: mealzProductHeight)
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: dim.mCornerRadius)
                .stroke(Color.mealzColor(.primary), lineWidth: 1)
        )
        .padding(.horizontal, dim.mPadding)
    }
}
