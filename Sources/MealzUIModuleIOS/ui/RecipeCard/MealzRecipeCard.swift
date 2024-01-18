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
    public func content(
        recipeCardDimensions: CGSize,
        recipe: Recipe,
        recipePrice: Double,
        numberOfGuests: Int,
        isCurrentlyInBasket: Bool,
        onAddToBasket: @escaping (String) -> Void,
        onShowRecipeDetails: @escaping (String) -> Void
    ) -> some View {
        let dimensions = Dimension.sharedInstance
        let callToActionHeight: CGFloat = 70
        let pictureHeight = recipeCardDimensions.height - callToActionHeight
//        let pricePerServe = recipePrice / Double(numberOfGuests)
        
        func showTimeAndDifficulty() -> Bool {
            return recipeCardDimensions.height >= 320
        }
        
        return VStack(spacing: 0.0) {
            VStack(spacing: 0.0) {
                ZStack {
                    AsyncImage(url: recipe.pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(0)
                            .frame(width: recipeCardDimensions.width, height: pictureHeight)
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
                                recipeId: recipe.id
                            ))
                        .padding(dimensions.mPadding)
                        Spacer()
                        HStack {
                            Text(recipe.title)
                                .foregroundColor(Color.mealzColor(.white))
                                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.75)
                            Spacer()
                            MealzSmallGuestView(guests: Int(numberOfGuests))
                        }.padding(Dimension.sharedInstance.mlPadding)
                    }
                }
                .padding(0)
                .frame(width: recipeCardDimensions.width, height: pictureHeight)
                .clipped()
                HStack {
                    MealzPricePerPerson(pricePerGuest: recipe.attributes?.price?.pricePerServe ?? recipePrice)
                    Spacer()
                    CallToAction(cardWidth: recipeCardDimensions.width, isCurrentlyInBasket: isCurrentlyInBasket) {
                        onShowRecipeDetails(recipe.id)
                    }
                }
                .frame(height: callToActionHeight)
                .padding(.horizontal, Dimension.sharedInstance.mlPadding)
            }
        }
        .onTapGesture {
            onShowRecipeDetails(recipe.id)
        }
        .padding(0)
        .frame(width: recipeCardDimensions.width, height: recipeCardDimensions.height)
        .cornerRadius(12.0)
        .overlay(
            RoundedRectangle(
                cornerRadius: 12.0)
            .stroke(Color.mealzColor(.border)
                    , lineWidth: 1.0))
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
                        Image.mealzIcon(icon: .basket)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(Color.mealzColor(.white))
                            .frame(width: 24, height: 24)
                    })
                    .padding(Dimension.sharedInstance.mlPadding)
                    .background(Color.mealzColor(isCurrentlyInBasket ? .lightBackground : .primary))
                    .cornerRadius(Dimension.sharedInstance.mPadding)
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
        MealzRecipeCard().content(
            recipeCardDimensions: CGSize(width: 380, height: 100),
            recipe: recipe,
            recipePrice: 12.4,
            numberOfGuests: 4,
            isCurrentlyInBasket: false,
            onAddToBasket: {_ in },
            onShowRecipeDetails: {_ in}
        )
        .padding(80.0)
    }
}

@available(iOS 14, *)
public struct DemoCatalogRecipeCardView: CatalogRecipeCardProtocol {
    public init() {} // if your views are in separate package like ours, make sure you have a public init
    public func content(
        recipeCardDimensions: CGSize,
        recipe: Recipe,
        recipePrice: Double,
        numberOfGuests: Int,
        isCurrentlyInBasket: Bool,
        onAddToBasket: @escaping (String) -> Void,
        onShowRecipeDetails: @escaping (String) -> Void
    ) -> some View {
        VStack {
            ZStack(alignment: .topTrailing) { // image & like button
                AsyncImage(url: recipe.pictureURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: recipeCardDimensions.width, maxHeight: 150)
                }
                LikeButton( // there are other parameters you can change to customize
                    likeButtonInfo: LikeButtonInfo(
                        recipeId: recipe.id,
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
            Text(recipe.title)
                .lineLimit(2)
            if !isCurrentlyInBasket { // button to add to basket if not here
                Button {
                    onAddToBasket(recipe.id)
                } label: {
                    Text(Localization.recipe.add.localised)
                }
            }
        }
        .onTapGesture { onShowRecipeDetails(recipe.id) } // tap entire card to see details
        .frame(width: recipeCardDimensions.width, height: recipeCardDimensions.height)
        .background(Color.green).cornerRadius(10)
    }
}