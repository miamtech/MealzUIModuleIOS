//
//  MealzPriceView.swift
//  
//
//  Created by didi on 03/10/2023.
//

import MealzIOSFramework
import SwiftUI

@available(iOS 14, *)
public struct MealzPriceView: PriceSuccessProtocol {
    private let pricePerPerson: Bool
    public init(
        pricePerPerson: Bool = true
    ) {
        self.pricePerPerson = pricePerPerson
    }
    public func content(
        price: Double,
        guests: Int,
        currency: String
    ) -> some View {
        
        func priceText() -> String {
            if pricePerPerson { return price.pricePerPerson(numberOfGuests: guests) }
            else { return price.currencyFormatted }
        }
        
        return Text(priceText())
                .foregroundColor(Color.mealzColor(.primary))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
    }
}

@available(iOS 14, *)
struct MealzPriceView_Previews: PreviewProvider {
    static var previews: some View {
        MealzPriceView().content(
            price: 34.2,
            guests: 4,
            currency: "EUR"
        )
    }
}
