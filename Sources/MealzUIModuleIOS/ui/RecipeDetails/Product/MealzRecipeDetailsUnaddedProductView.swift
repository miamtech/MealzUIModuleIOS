//
//  MealzRecipeDetailsUnaddedProductView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzRecipeDetailsUnaddedProductView: RecipeDetailsUnaddedProductProtocol {
    public init() {}
    let dim = Dimension.sharedInstance
    public func content(params: RecipeDetailsUnaddedProductParameters) -> some View {
        VStack {
            HStack {
                Text(params.data.ingredientName.capitalizingFirstLetter())
                    .padding(dim.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                    .foregroundColor(Color.mealzColor(.standardDarkText))
                Spacer()
                if let unit = params.data.ingredientUnit {
                    Text(QuantityFormatter.companion.readableFloatNumber(value: params.data.ingredientQuantity, unit: unit))
                        .padding(dim.mPadding)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                }
            }
            .foregroundColor(Color.mealzColor(.darkestGray))
            .frame(height: 40)
            .background(Color.mealzColor(.lightBackground))
            .cornerRadius(dim.mCornerRadius, corners: .top)
            
            HStack {
                if let pictureURL = URL(string: params.data.pictureURL) {
                    AnyView(AsyncImage(url: pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }).frame(width: 72, height: 72)
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
                    Button(action: params.onChooseProduct, label: {
                        Text(Localization.myBudget.replaceItem.localised)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                            .foregroundColor(Color.mealzColor(.primary))
                    })
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal, dim.mlPadding)
                .padding(.top, dim.mPadding)
            }
            HStack(spacing: Dimension.sharedInstance.lPadding) {
                Text(params.data.formattedProductPrice)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                    .foregroundColor(Color.mealzColor(.primaryText))
                Spacer()
                Button(action: params.onIgnoreProduct, label: {
                    Text(Localization.ingredient.ignoreProduct.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                        .foregroundColor(Color.mealzColor(.grayText))
                })
                Button(action: params.onAddProduct, label: {
                    Image.mealzIcon(icon: .basket)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color.mealzColor(.white))
                        .padding(dim.mlPadding)
                        .background(Color.mealzColor(.primary)
                            .cornerRadius(dim.buttonCornerRadius))
                        .frame(width: 48, height: 48)
                })
            }
            .padding(.horizontal, dim.mlPadding)
            Spacer()
        }
        .frame(height: mealzProductHeight)
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: dim.mCornerRadius)
                .stroke(Color.mealzColor(.lightBackground), lineWidth: 1)
        )
        .padding(.horizontal, dim.mPadding)
    }
}
