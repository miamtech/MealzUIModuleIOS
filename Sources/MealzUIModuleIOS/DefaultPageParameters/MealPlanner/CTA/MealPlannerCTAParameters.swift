//
//  MealPlannerCTAParameters.swift
//  
//
//  Created by didi on 10/10/2023.
//

import SwiftUI
import MiamIOSFramework

/**
 A class implementing the necessary parameters for the Meal Planner Call To Action.
 
 Mandatory Parameters:
 - onNavigateToMealPlannerForm: () -> Void: A closure that navigates the user to the Meal Planner Feature
 
 Optional Parameters:
 - viewOptions: ``MealPlannerCTAViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class MealPlannerCTAParameters: MealPlannerCTAParametersProtocol {
    public var onNavigateToMealPlannerForm: () -> Void
    public var callToAction: TypeSafeMealPlannerCTA
    
    public init(
        onNavigateToMealPlannerForm: @escaping () -> Void,
        viewOptions: MealPlannerCTAViewOptions = MealPlannerCTAViewOptions()
    ) {
        self.onNavigateToMealPlannerForm = onNavigateToMealPlannerForm
        self.callToAction = viewOptions.callToAction
    }
}
