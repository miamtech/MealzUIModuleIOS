//
//  MealzAddAllToBasketCTA.swift
//
//
//  Created by Diarmuid McGonagle on 12/01/2024.
//

import Foundation
import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzAddAllToBasketCTA: View {
    let callToAction: () -> Void
    let buttonText: String
    let disableButton: Bool
    let isCurrentlyInBasket: Bool
    
    public init(
        callToAction: @escaping () -> Void,
        buttonText: String = Localization.recipeDetails.addAllProducts.localised,
        disableButton: Bool = false,
        isCurrentlyInBasket: Bool = false
    ) {
        self.callToAction = callToAction
        self.buttonText = buttonText
        self.disableButton = disableButton
        self.isCurrentlyInBasket = isCurrentlyInBasket
    }
    
    public var body: some View {
        Button(action: callToAction, label: {
            Image.mealzIcon(icon: .basket)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(Color.mealzColor(.white))
                .frame(width: 24, height: 24)
            Text(buttonText)
                .foregroundColor(Color.mealzColor(.white))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.75)
        })
        .padding(Dimension.sharedInstance.mlPadding)
        .background(Color.mealzColor(isCurrentlyInBasket ? .lightBackground : .primary))
        .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
        .disabled(disableButton)
        .darkenView(disableButton)
    }
}
