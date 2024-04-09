//
//  MealzMyBasketFooter.swift
//
//
//  Created by Diarmuid McGonagle on 08/04/2024.
//

import SwiftUI
import MealzIOSFramework
import mealzcore

@available(iOS 14, *)
public struct MealzMyBasketFooter: MyBasketFooterProtocol {
    public init() {}
    public func content(params: MyBasketFooterParameters) -> some View {
        var lockButton: Bool {
            return params.basketStatus == .empty
            || params.basketStatus == ComponentUiState.loading
            || params.basketStatus == .idle
        }
        return HStack(spacing: 0) {
            if params.totalPrice > 0.0 { // only show if there are items in the basket
                if params.basketStatus == .loading || params.basketStatus == .idle {
                    ProgressLoader(color: .primary, size: 24)
                } else {
                    PriceInMyBasket(totalPriceInBasket: params.totalPrice.currencyFormatted)
                }
                Spacer()
                CallToAction(buttonText: "Passer Commande", disableButton: lockButton, callToAction: params.submitOrder)
            }
        }
        .padding(Dimension.sharedInstance.lPadding)
        .frame(maxWidth: .infinity)
        .frame(height: params.heightOfFooter)
        .background(params.totalPrice > 0.0 ? Color.white : Color.clear)
    }
    
    internal struct CallToAction: View {
        let buttonText: String
        let disableButton: Bool
        let callToAction: () -> Void
        
        var body: some View {
            Button(action: callToAction, label: {
                Text(buttonText)
                    .foregroundColor(Color.mealzColor(.standardLightText))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
            })
            .padding(.vertical, Dimension.sharedInstance.mlPadding)
            .padding(.horizontal, Dimension.sharedInstance.lPadding)
            .background(
                RoundedRectangle(cornerRadius: Dimension.sharedInstance.buttonCornerRadius)
                    .foregroundColor(Color.mealzColor(.primary))
            )
            .disabled(disableButton)
            .darkenView(disableButton)
        }
    }
}
