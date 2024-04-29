//
//  MealzMyBasketOpenItemSelectorCTA.swift
//
//
//  Created by miam x didi on 23/04/2024.
//

import SwiftUI
import MealzIOSFramework


@available(iOS 14, *)
public struct MealzMyBasketOpenItemSelectorCTA: BaseButtonProtocol {
    public init() {}
    public func content(params: BaseButtonParameters) -> some View {
        VStack {
            Text(params.buttonText)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                .foregroundColor(Color.mealzColor(.primaryText))
            Button {
                params.onButtonAction()
            } label: {
                Text(Localization.myBasket.addARecipe.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                    .foregroundColor(Color.mealzColor(.primary))
            }
            .padding(.horizontal, Dimension.sharedInstance.mPadding)
            .padding(.vertical, Dimension.sharedInstance.sPadding)
            .overlay(
                Capsule().stroke(Color.mealzColor(.primary), lineWidth: 1.0))
            .padding(Dimension.sharedInstance.mPadding)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: Dimension.sharedInstance.mCornerRadius )
                .foregroundColor(Color.mealzColor(.lightBackground)))
        .padding()
    }
}
