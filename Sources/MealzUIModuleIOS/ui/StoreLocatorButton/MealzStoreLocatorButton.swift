//
//  MealzStoreLocatorButton.swift
//
//
//  Created by miam x didi on 29/04/2024.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzStoreLocatorButton: BaseButtonProtocol {
    public init() {}
    
    public func content(params: BaseButtonParameters) -> some View {
        Button(action: params.onButtonAction, label: {
            HStack {
                Text(params.buttonText)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
                    .foregroundColor(Color.mealzColor(.primary))
                Spacer()
                HStack {
                    Image.mealzIcon(icon: .swap)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color.mealzColor(.primary))
                    Text(Localization.storeLocatorButton.cta.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                        .foregroundColor(Color.mealzColor(.primary))
                }
                .padding(.vertical, Dimension.sharedInstance.mPadding)
                .padding(.horizontal, Dimension.sharedInstance.mlPadding)
                .background(
                    Capsule().foregroundColor(Color.mealzColor(.white)))
                .padding(.vertical, Dimension.sharedInstance.mPadding)
            }
        })
        .padding(.horizontal, Dimension.sharedInstance.lPadding)
        .frame(maxWidth: .infinity)
        .background(Color.mealzColor(.primaryBackground))
    }
}
