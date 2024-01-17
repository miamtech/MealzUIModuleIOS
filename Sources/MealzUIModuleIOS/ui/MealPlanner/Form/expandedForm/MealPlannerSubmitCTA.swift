//
//  MealPlannerSubmitCTA.swift
//  MiamIOSFramework
//
//  Created by didi on 5/9/23.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available (iOS 14, *)
internal struct MealPlannerSubmitCTA: View {
    let isLoading: Bool
    let onButtonAction: () -> Void
    // this will come from state

    @State var isEnabled = true
    var backgroundColor: Color {
        return isEnabled ? Color.mealzColor(.primary) : Color.mealzColor(.lightBackground)
    }
    var buttonStrokeColor: Color {
        return isEnabled ? Color.mealzColor(.primary) : Color.clear
    }
    var buttonTextColor: Color {
        return isEnabled ? Color.mealzColor(.lighterGray) : Color.mealzColor(.darkerGray)
    }
    var buttonText: String {
        Localization.myBudget.planMealsTitle.localised
    }
    let dimension = Dimension.sharedInstance
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    onButtonAction()
                }
            } label: {
                if isLoading {
                    ProgressLoader(color: .white)
                        .scaleEffect(0.5)
                } else {
                    Text(buttonText)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                        .padding(dimension.lPadding)
                        .foregroundColor(buttonTextColor)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(backgroundColor)
            .cornerRadius(dimension.mCornerRadius)
            .overlay(RoundedRectangle(cornerRadius: dimension.mCornerRadius)
                .stroke(buttonStrokeColor, lineWidth: 1.0)
            )
            .disabled(!isEnabled)
            .darkenView(!isEnabled)
        }
    }
}

@available (iOS 14, *)
struct MealPlannerSubmitCTA_Previews: PreviewProvider {
    @State static var budget: Int = 0
    static var previews: some View {
        MealPlannerSubmitCTA(isLoading: false) {
            print("hello world")
        }
    }
}
