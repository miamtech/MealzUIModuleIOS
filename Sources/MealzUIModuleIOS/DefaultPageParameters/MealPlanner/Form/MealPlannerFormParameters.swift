//
//  MealPlannerFormParameters.swift
//  
//
//  Created by didi on 10/10/2023.
//

import MiamIOSFramework

/**
 A class implementing the necessary parameters for the Meal Planner Form
 
 Mandatory Parameters:
 - onNavigateToMealPlannerResults: ([String]) -> Void: A closure that navigates the user to the Meal Planner Results where they can see the meals generated for them by their input.
 
 Optional Parameters:
 - viewOptions: ``MealPlannerFormViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class MealPlannerFormParameters: MealPlannerFormParametersProtocol {
    public var actions: MealPlannerFormActions
    
    public var form: TypeSafeMealPlannerForm
    
    
    public init(
        actions: MealPlannerFormActions,
        viewOptions: MealPlannerFormViewOptions = MealPlannerFormViewOptions()
    ) {
        self.actions = actions
        self.form = viewOptions.form
        
    }
}
