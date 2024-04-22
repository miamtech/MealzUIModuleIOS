//
//  PriceInMyBasket.swift
//
//
//  Created by Diarmuid McGonagle on 08/04/2024.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct PriceInMyBasket: View {
    let totalPriceInBasket: String
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(totalPriceInBasket)
                .foregroundColor(Color.mealzColor(.primaryText))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            Text(Localization.recipeDetails.inMyBasket.localised)
                .foregroundColor(Color.mealzColor(.primaryText))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyExtraSmallStyle)
        }
    }
}
