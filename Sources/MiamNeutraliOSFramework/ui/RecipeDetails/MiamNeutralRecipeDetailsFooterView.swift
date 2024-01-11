//
//  MiamNeutralRecipeDetailsFooterView.swift
//
//
//  Created by didi on 6/19/23.
//

import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsFooterView: RecipeDetailsFooterProtocol {
    
    public init() {}
    
    let dimension = Dimension.sharedInstance
    public func content(
        price: Double,
        ingredientsStatus: IngredientStatus,
        callToAction: @escaping () -> Void
    ) -> some View {
        VStack(spacing: 0) {
                VStack {
                    Divider()
                    Button(action: {
                        callToAction()
                    }, label: {
                        Text(Localization.recipe.add.localised)
                            .foregroundColor(Color.mealzColor(.primary))
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                    })
                    Spacer()
                }.frame(height: 35)
            VStack {
                Divider()
                Text(price.currencyFormatted)
                Text(Localization.price.perGuest.localised)
                    .foregroundColor(Color.mealzColor(.lightGray))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                Spacer()
            }.frame(height: 55)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}
//
//@available(iOS 14, *)
//struct CoursesURecipeDetailsFooterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.miamColor(.lightGreyBackground)
//            VStack {
//                MiamNeutralRecipeDetailsFooterView().content(recipeId: "34134321", guestCount: 4, isInCart: false, onContinueToBasket: nil)
//                MiamNeutralRecipeDetailsFooterView().content(recipeId: "34134321", guestCount: 4, isInCart: true, onContinueToBasket: nil)
//                MiamNeutralRecipeDetailsFooterView().content(recipeId: "34134321", guestCount: 4, isInCart: false, onContinueToBasket: nil)
//            }
//        }
//        GeometryReader { geometry in
//            let safeArea = geometry.safeAreaInsets
//            ZStack(alignment: .bottom) {
//                ScrollView {
//                    VStack {
//                        LazyVStack(spacing: 0) {
//                            ForEach(1..<11) { index in
//                                VStack {
//                                    Text("hello world \(index)")
//                                    AsyncImage(url: URL(string: "https://picsum.photos/200/300")!) { image in
//                                        image
//                                            .resizable()
//                                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
//                                    }
//                                }
//                            }
//                        }
//                        .padding(.bottom, (geometry.safeAreaInsets.bottom + 150)) // Add padding for safe area at bottom
//                    }
//                }
//                StickyFooter(safeArea: safeArea) {
//                    MiamNeutralRecipeDetailsFooterView().content(recipeId: "34134321", guestCount: 4, isInCart: false, onContinueToBasket: nil)
//                }
//                .frame(maxWidth: .infinity)
//            }
//        }
//    }
//}
//
