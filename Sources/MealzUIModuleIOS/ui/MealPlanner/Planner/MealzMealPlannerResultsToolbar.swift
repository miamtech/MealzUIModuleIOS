//
//  MealzMealPlannerResultsToolbar.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 26/04/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzMealPlannerResultsToolbar: MealPlannerResultsToolbarProtocol {
    let dimension = Dimension.sharedInstance
    public init() {}
    public func content(params: MealPlannerResultsToolbarParameters) -> some View {
        HStack {
            MealzMealPlannerBudget(
                budget: params.mealPlannerCriteria.availableBudget,
                currency: Localization.price.currency.localised)
            MealzStepperCollapsed(
                value: params.mealPlannerCriteria.numberOfGuests,
                icon: Image.mealzIcon(icon: .guests))
            MealzStepperCollapsed(
                value: params.mealPlannerCriteria.numberOfMeals,
                icon: Image.mealzIcon(icon: .cutlery))
            SubmitButtonCollapsed(
                isLoading: params.$isLoadingRecipes,
                activelyEditingTextField: params.$activelyEditingTextField.wrappedValue) {
                    params.onValidateTapped()
            }
        }
    }
}

@available (iOS 14, *)
internal struct SubmitButtonCollapsed: View {
    @Binding var isLoading: Bool
    var activelyEditingTextField: Bool
    let onButtonAction: () -> Void
    let dimension = Dimension.sharedInstance
    var body: some View {
        Button {
            // dismiss keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            withAnimation {
                isLoading.toggle()
                onButtonAction()
            }
        } label: {
            if isLoading {
                ProgressLoader(color: .white)
                    .scaleEffect(0.5)
            } else {
                Image.mealzIcon(icon: .reset)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(Color.mealzColor(.white))
                    .frame(width: dimension.lButtonHeight, height: dimension.lButtonHeight)
            }
        }
        .frame(width: 50, height: 50)
        .background(Color.mealzColor(.primary))
        .cornerRadius(dimension.mCornerRadius)
        .disabled(activelyEditingTextField)
        .darkenView(activelyEditingTextField)
    }
}

@available(iOS 14, *)
struct MiamBudgetPlannerToolbar_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }

    struct Preview: View {
        @State var loading = false
        @State var mealPlannerCriteria = MealPlannerCriteria(
            availableBudget: 30.0,
            numberOfGuests: 4,
            numberOfMeals: 4)
        var body: some View {
            MealzMealPlannerResultsToolbar().content(
                params: MealPlannerResultsToolbarParameters(
                mealPlannerCriteria: $mealPlannerCriteria,
                activelyEditingTextField: .constant(false),
                isLoadingRecipes: $loading,
                onValidateTapped: {})
                )
        }
    }
}
