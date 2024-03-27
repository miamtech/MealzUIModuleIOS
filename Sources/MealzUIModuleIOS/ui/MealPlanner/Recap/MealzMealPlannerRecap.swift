//
//  MiamBudgetRecap.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 28/06/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import Foundation
import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzMealPlannerRecap: MealPlannerRecapProtocol {
    public init() {}
    public func content(params: MealPlannerRecapViewParameters) -> some View {
        VStack(alignment: .center, spacing: 32.0) {
            HStack {
                Image.mealzIcon(icon: .check)
            }
            .padding(24.0)
            .frame(maxWidth: .infinity)
            .background(Color.mealzColor(.brownishYellow))
            .clipShape(RoundedRectangle(cornerRadius: 6.0))
            
            Text(Localization.myBudget.mealPlannerProductAdded.localised)
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            
            HStack(alignment: .top) {
                // Space Between
                Text(String(format: String.localizedStringWithFormat(Localization.myBudget.mealPlannerMealsFor(numberOfMeals: Int32(params.numberOfMeals)).localised,params.numberOfMeals),params.numberOfMeals))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                Spacer()
                // Alternative Views and Spacers
                Text(params.totalPrice.currencyFormatted)
                    .foregroundColor(Color.mealzColor(.primary))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            }
            .padding(16)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .inset(by: 0.5)
                    .stroke(Color.mealzColor(.border), lineWidth: 1)
            )
            
            Divider()
                .frame(height: 1.0)
            
            Text(Localization.myBudget.mealPlannerDiscover.localised)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            Button {
                params.onTapGesture()
            } label: {
                Text(Localization.myBudget.mealPlannerPromotion.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
            }
            .padding(.vertical, Dimension.sharedInstance.lPadding)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.mealzColor(.primary))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            Spacer()
        }
        .padding(Dimension.sharedInstance.lPadding)
    }
}

@available(iOS 14, *)
struct MealzMealPlannerRecapPreviews: PreviewProvider {
    static var previews: some View {
        MealzMealPlannerRecap().content(
            params: MealPlannerRecapViewParameters(
                numberOfMeals: 4,
                totalPrice: 34.32) {
                }
        )
    }
}
