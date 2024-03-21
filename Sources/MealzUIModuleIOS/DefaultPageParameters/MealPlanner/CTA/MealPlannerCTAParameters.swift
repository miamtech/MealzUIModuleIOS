//
//  MealPlannerCTAParameters.swift
//  
//
//  Created by didi on 10/10/2023.
//

import SwiftUI
import MealzIOSFramework

/**
 A class implementing the necessary parameters for the Meal Planner Call To Action.
 
 Mandatory Parameters:
 - onNavigateToMealPlannerForm: () -> Void: A closure that navigates the user to the Meal Planner Feature
 
 Optional Parameters:
 - viewOptions: ``MealPlannerCTAViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class MealPlannerCTAParameters: MealPlannerCTAParametersProtocol {
    public var actions: MealPlannerCTAActions
    public var callToAction: TypeSafeMealPlannerCTA
    
    public init(
        actions: MealPlannerCTAActions,
        viewOptions: MealPlannerCTAViewOptions = MealPlannerCTAViewOptions()
    ) {
        self.actions = actions
        self.callToAction = viewOptions.callToAction
    }
}
