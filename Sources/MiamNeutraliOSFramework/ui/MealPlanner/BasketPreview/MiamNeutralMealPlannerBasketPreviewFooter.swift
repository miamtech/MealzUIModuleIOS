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
public struct MiamNeutralMealPlannerBasketPreviewFooter: MealPlannerBasketFooterProtocol {
    public init() {}
    public func content(
        onNavigateToRecap: @escaping () -> Void,
        onNavigateToBasket: @escaping () -> Void
    ) -> some View {
        VStack {
            Button {
                onNavigateToRecap()
            } label: {
                Text("Continuer mes achats")
            }
            .padding(Dimension.sharedInstance.lPadding)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.mealzColor(.primary))
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
            .cornerRadius(Dimension.sharedInstance.mCornerRadius)

            Button {
                onNavigateToBasket()
            } label: {
                Text("Voir mon panier")
            }
            .padding(Dimension.sharedInstance.lPadding)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.mealzColor(.primary))
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
            .overlay(RoundedRectangle(cornerRadius: Dimension.sharedInstance.mCornerRadius)
                .stroke(Color.mealzColor(.primary), lineWidth: 1.0))
        }
        .padding(Dimension.sharedInstance.lPadding)
        .background(Color.mealzColor(.standardLightText))
    }
}

@available(iOS 14, *)
struct MiamNeutralMealPlannerBasketPreviewFooter_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralMealPlannerBasketPreviewFooter().content(
            onNavigateToRecap: {}, onNavigateToBasket: {}
        )
    }
}
