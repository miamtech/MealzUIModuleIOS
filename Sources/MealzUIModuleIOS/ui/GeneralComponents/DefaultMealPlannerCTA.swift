//
//  DefaultMealPlannerCTA.swift
//
//
//  Created by didi on 10/08/2023.
//
import SwiftUI
import MealzIOSFramework

// this is implemented empty so that clients have the option to NOT have the meal Planner
@available(iOS 14, *)
public struct DefaultMealPlannerCTA: MealPlannerCTAProtocol {
    public init() {}
    public func content(params: MealPlannerCTAViewParameters) -> some View {
        HStack {}
    }
}

@available(iOS 14, *)
struct DefaultMealPlannerCTA_Previews: PreviewProvider {
    static var previews: some View {
        DefaultMealPlannerCTA().content(
            params: MealPlannerCTAViewParameters(
            onTapGesture: {})
            )
    }
}
