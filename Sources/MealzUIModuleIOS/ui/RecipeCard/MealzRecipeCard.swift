//
//  MealzRecipeCard.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 26/05/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzRecipeCard: CatalogRecipeCardProtocol {
    public init() {}
    public func content(params: CatalogRecipeCardParameters) -> some View {
        let dimensions = Dimension.sharedInstance
        let callToActionHeight: CGFloat = 70
        let pictureHeight = params.recipeCardDimensions.height - callToActionHeight
        
        func showTimeAndDifficulty() -> Bool {
            return params.recipeCardDimensions.height >= 320
        }
        
        return VStack(spacing: 0.0) {
            VStack(spacing: 0.0) {
                ZStack {
                    AsyncImage(url: params.recipe.pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(0)
                            .frame(width: params.recipeCardDimensions.width, height: pictureHeight)
                            .clipped()
                    }
                    .contentShape(Rectangle()) // this fixes gesture detector overflow to other cards
                    .padding(0)
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color.clear, Color.black.opacity(0.3)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    VStack(alignment: .trailing, spacing: 0) {
                        LikeButton(
                            likeButtonInfo: LikeButtonInfo(
                                recipeId: params.recipe.id
                            ))
                        .padding(dimensions.mPadding)
                        Spacer()
                        HStack {
                            Text(params.recipe.title)
                                .foregroundColor(Color.mealzColor(.white))
                                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.75)
                            Spacer()
                            MealzSmallGuestView(guests: Int(params.numberOfGuests))
                        }.padding(Dimension.sharedInstance.mlPadding)
                    }
                }
                .padding(0)
                .frame(width: params.recipeCardDimensions.width, height: pictureHeight)
                .clipped()
                HStack {
                    MealzPricePerPerson(pricePerGuest: params.recipe.attributes?.price?.pricePerServe ?? params.recipePrice)
                    Spacer()
                    CallToAction(cardWidth: params.recipeCardDimensions.width, isCurrentlyInBasket: params.isCurrentlyInBasket) {
                        params.onAddToBasket(params.recipe.id)
                    }
                }
                .frame(height: callToActionHeight)
                .padding(.horizontal, Dimension.sharedInstance.mlPadding)
            }
        }
        .onTapGesture {
            params.onShowRecipeDetails(params.recipe.id)
        }
        .padding(0)
        .frame(width: params.recipeCardDimensions.width, height: params.recipeCardDimensions.height)
        .background(Color.mealzColor(.white))
        .cornerRadius(Dimension.sharedInstance.lCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Dimension.sharedInstance.lCornerRadius)
            .stroke(Color.mealzColor(.border), lineWidth: 1.0))
    }
    
    internal struct CallToAction: View {
        let cardWidth: CGFloat
        let isCurrentlyInBasket: Bool
        let callToAction: () -> Void
        var body: some View {
            VStack {
                if cardWidth >= 225 {
                    MealzAddAllToBasketCTA(callToAction: callToAction, isCurrentlyInBasket: isCurrentlyInBasket)
                } else {
                    Button(action: callToAction, label: {
                        if isCurrentlyInBasket {
                            Image.mealzIcon(icon: .basketCheck)
//                                .renderingMode(.template)
                                .resizable()
//                                .foregroundColor(Color.mealzColor(.primary))
                                .frame(width: 24, height: 24)
                        } else {
                            Image.mealzIcon(icon: .basket)
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(Color.mealzColor(.white))
                                .frame(width: 24, height: 24)
                        }
                    })
                    .padding(Dimension.sharedInstance.mlPadding)
                    .background(Color.mealzColor(isCurrentlyInBasket ? .white : .primary))
                    .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: Dimension.sharedInstance.buttonCornerRadius)
                            .stroke(isCurrentlyInBasket ? Color.mealzColor(.primary) : Color.clear, lineWidth: 1)
                    )
                }
            }
        }
    }
}


@available(iOS 14, *)
struct MealzRecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = RecipeFakeFactory().create(
            id: RecipeFakeFactory().FAKE_ID,
            attributes: RecipeFakeFactory().createAttributes(
                title: "Parmentier de Poulet",
                mediaUrl: "https://lh3.googleusercontent.com/tbMNuhJ4KxReIPF_aE0yve0akEHeN6O8hauty_XNUF2agWsmyprACLg0Zw6s8gW-QCS3A0QmplLVqBKiMmGf_Ctw4SdhARvwldZqAtMG"),
            relationships: nil)
        MealzRecipeCard()
            .content(
            params: CatalogRecipeCardParameters(
            recipeCardDimensions: CGSize(width: 380, height: 100),
            recipe: recipe,
            recipePrice: 12.4,
            numberOfGuests: 4,
            isCurrentlyInBasket: false,
            onAddToBasket: {_ in },
            onShowRecipeDetails: {_ in}
        ))
        .padding(80.0)
    }
}

@available(iOS 14, *)
public struct DemoCatalogRecipeCardView: CatalogRecipeCardProtocol {
    public init() {} // if your views are in separate package like ours, make sure you have a public init
    public func content(params: CatalogRecipeCardParameters) -> some View {
        VStack {
            ZStack(alignment: .topTrailing) { // image & like button
                AsyncImage(url: params.recipe.pictureURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: params.recipeCardDimensions.width, maxHeight: 150)
                }
                LikeButton( // there are other parameters you can change to customize
                    likeButtonInfo: LikeButtonInfo(
                        recipeId: params.recipe.id,
                        likedIcon: Image.mealzIcon(icon: .caret),
                        unlikedIcon: Image.mealzIcon(icon: .basket),
                        iconSize: CGSize(width: 20, height: 20),
                        backgroundSize: CGSize(width: 25, height: 25),
                        backgroundColor: Color.red,
                        backgroundShape: AnyShape(Rectangle())
                    )
                ).padding(10)
            }
            .frame(height: 150)
            Text(params.recipe.title)
                .lineLimit(2)
            if !params.isCurrentlyInBasket { // button to add to basket if not here
                Button {
                    params.onAddToBasket(params.recipe.id)
                } label: {
                    Text(Localization.recipe.add.localised)
                }
            }
        }
        .onTapGesture { params.onShowRecipeDetails(params.recipe.id) } // tap entire card to see details
        .frame(width: params.recipeCardDimensions.width, height: params.recipeCardDimensions.height)
        .background(Color.green).cornerRadius(10)
    }
}
