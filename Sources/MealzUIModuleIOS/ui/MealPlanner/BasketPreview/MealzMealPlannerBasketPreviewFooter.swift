//
//  MiamMealPlannerBasketPreviewFooter.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 08/06/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzMealPlannerBasketPreviewFooter: MealPlannerBasketFooterProtocol {
    public init() {}
    public func content(params: MealPlannerBasketFooterParamaters) -> some View {
        VStack {
            Button {
                params.onNavigateToRecap()
            } label: {
                Text(Localization.basket.continueShopping.localised)
            }
            .padding(Dimension.sharedInstance.lPadding)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.mealzColor(.primary))
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
            .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
        }
        .padding(.vertical, Dimension.sharedInstance.mPadding)
        .padding(.horizontal, Dimension.sharedInstance.lPadding)
        .background(Color.mealzColor(.standardLightText))
        .frame(height: params.footerHeight)
    }
}
