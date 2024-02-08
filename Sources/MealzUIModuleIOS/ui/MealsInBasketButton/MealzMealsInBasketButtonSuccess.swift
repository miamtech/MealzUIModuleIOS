//
//  MealzMealsInBasketButtonSuccess.swift
//  
//
//  Created by didi on 03/10/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzMealsInBasketButtonSuccess: MealsInBasketButtonSuccessProtocol {
    public init() {}
    public func content(params: MealsInBasketButtonSuccessParameters) -> some View {
        Button {
            params.onNavigateToMyMeals()
        } label: {
            HStack {
                Image.mealzIcon(icon: .cutlery)
                    .renderingMode(.template)
                    .foregroundColor(Color.mealzColor(.primary))
                Spacer()
                Text(Localization.myMeals.mealsAdded(numberOfMeals: Int32(params.mealsCount)).localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                Spacer()
                Image.mealzIcon(icon: .caret)
                    .renderingMode(.template)
                    .foregroundColor(Color.mealzColor(.primary))
            }
            .frame(maxWidth: .infinity)
            .padding(Dimension.sharedInstance.lPadding)
        }
        .background(Color.mealzColor(.lightBackground))
        .foregroundColor(Color.mealzColor(.primary))
        .cornerRadius(Dimension.sharedInstance.buttonCornerRadius, corners: [.top])
    }
}
