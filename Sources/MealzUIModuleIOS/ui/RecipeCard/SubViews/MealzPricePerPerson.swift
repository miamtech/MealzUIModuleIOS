//
//  MealzPricePerPerson.swift
//
//
//  Created by Diarmuid McGonagle on 12/01/2024.
//

import Foundation
import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzPricePerPerson: View {
    let pricePerGuest: Double
    public init(pricePerGuest: Double) {
        self.pricePerGuest = pricePerGuest
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(pricePerGuest.currencyFormatted)
                .foregroundColor(Color.mealzColor(.primary))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            Text(Localization.myMeals.perPerson.localised)
                .foregroundColor(Color.mealzColor(.grayText))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
        }
    }
}
