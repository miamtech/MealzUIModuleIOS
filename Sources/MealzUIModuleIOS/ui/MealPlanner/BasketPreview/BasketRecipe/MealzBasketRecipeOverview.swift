//
//  MealzBasketRecipeOverview.swift
//  
//
//  Created by didi on 02/10/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzBasketRecipeOverview: BasketRecipeOverviewProtocol {
    public init() {}
    public func content(params: BasketRecipeOverviewParameters) -> some View {
        func recipePicture() -> some View {
            return AsyncImage(url: params.data.recipe.pictureURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 120, height: 120, alignment: .topLeading)
            .cornerRadius(12.0)
            .clipped()
        }
        
        var chevronAngle: CGFloat {
            if params.data.isExpanded { return 90.0}
            else { return 0.0 }
        }
        
        func linkToRecipeDetail() -> some View {
            return  Button {
                params.onShowRecipeDetails(params.data.recipe.id)
            } label: {
                Text(Localization.recipe.showDetails.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                    .foregroundColor(Color.mealzColor(.primaryText))
            }
            .padding([.top], Dimension.sharedInstance.sPadding)
        }
        
        return VStack(alignment: .leading, spacing: 0) {
            HStack {
                recipePicture()
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(params.data.recipe.attributes?.title ?? "")
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
                            .foregroundColor(Color.mealzColor(.standardDarkText))
                        Spacer()
                        Button {
                            params.onDeleteRecipe()
                        } label: {
                            Image.mealzIcon(icon: .trash)
                                .renderingMode(.template)
                                .foregroundColor(Color.mealzColor(.primary))
                        }
                    }.frame(maxWidth: .infinity)
                    Text(params.data.price.pricePerPersonWithText(numberOfGuests: params.data.guests))
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigLightStyle)
                        .foregroundColor(Color.mealzColor(.grayText))
                    HStack {
                        linkToRecipeDetail()
                        Spacer()
                        if params.data.isExpandable {
                            Button {
                                withAnimation(.default) {
                                    params.onExpand()
                                }
                            } label: {
                                Image.mealzIcon(icon: .caret)
                                    .renderingMode(.template)
                                    .foregroundColor(Color.mealzColor(.standardDarkText))
                                    .rotationEffect(Angle.degrees(chevronAngle))
                            }.padding([.trailing], Dimension.sharedInstance.lPadding)
                        }
                    }
                }.padding([.leading], Dimension.sharedInstance.sPadding)
            }
            .frame(height: params.recipeCardDimensions.height, alignment: .topLeading)
            HStack {
                if params.data.isReloading {
                    ProgressLoader(color: Color.mealzColor(.primary), size: 14)
                } else {
                    Text(params.data.price.currencyFormatted)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                        .foregroundColor(Color.mealzColor(.primary))
                }
                Spacer()
                MealzCounterView(
                    count: params.data.guests,
                    lightMode: false,
                    onCounterChanged: { guestCount in params.onUpdateGuests(guestCount) },
                    isLoading: params.data.isReloading,
                    isDisable: params.data.isReloading,
                    minValue: 1,
                    maxValue: 99)
            }
        }
        .padding([.leading, .trailing], 16.0)
        .padding(.top, Dimension.sharedInstance.sPadding)
    }
}

@available(iOS 14, *)
#Preview(body: {
    let recipe = FakeRecipe().createRandomFakeRecipe()
    let basketData = BasketRecipeData(
        recipe: recipe,
        price: 14.56,
        guests: 3,
        isReloading: false,
        totalProductCount: 4,
        isExpandable: false,
        isExpanded: false
    )
    return MealzBasketRecipeOverview().content(params: BasketRecipeOverviewParameters(
        recipeCardDimensions: CGSize(width: 300, height: 300),
        data: basketData,
        onDeleteRecipe: {},
        onExpand: {},
        onUpdateGuests: {_ in},
        onShowRecipeDetails: {_ in}))
})
