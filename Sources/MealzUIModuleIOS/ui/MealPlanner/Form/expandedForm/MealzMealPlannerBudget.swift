//
//  MealPlannerBudget.swift
//  MealzIOSFramework
//
//  Created by didi on 5/9/23.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
internal struct MealzMealPlannerBudget: View {
    @Binding var budget: Double
    let caption: String?
    let currency: String
    init(
        budget: Binding<Double>,
        caption: String? = nil,
        currency: String
    ) {
        self._budget = budget
        self.caption = caption
        self.currency = currency
    }
    var body: some View {
        VStack(spacing: Dimension.sharedInstance.sPadding) {
            if let caption = caption {
                MandatoryTextField(caption: caption)
            }
            HStack(spacing: 0) {
                Currency(currency: currency)
                Divider()
                    .background(Color.mealzColor(.lightBackground))
                Budget(budget: $budget, onBudgetChanged: { _ in })
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .overlay(RoundedRectangle(cornerRadius: Dimension.sharedInstance.sCornerRadius)
                .stroke(Color.mealzColor(.lightBackground), lineWidth: 0.5))
        }
    }
}

@available(iOS 14, *)
internal struct Currency: View {
    let currency: String
    var body: some View {
        Text(currency)
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
            .padding(Dimension.sharedInstance.mPadding)
    }
}

@available(iOS 14, *)
internal struct Budget: View {
    @Binding public var budget: Double
    public var onBudgetChanged: (Double) -> Void

    var body: some View {
        TextField("", value: $budget, formatter: NumberFormatter())
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
            .multilineTextAlignment(.leading)
            .keyboardType(.numberPad)
            .padding(Dimension.sharedInstance.mPadding)
            .onChange(of: budget) { newValue in
                onBudgetChanged(newValue)
            }
    }
}

@available(iOS 14, *)
struct MealzMealPlannerBudget_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State var value = 0.0
        var body: some View {
            MealzMealPlannerBudget(
                budget: $value,
                caption: "Total Budget",
                currency: "EUR")
                .background(Color.white)
        }
    }
}
