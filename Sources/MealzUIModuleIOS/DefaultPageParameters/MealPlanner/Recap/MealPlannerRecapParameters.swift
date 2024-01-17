//
//  MealPlannerRecapParameters.swift
//  
//
//  Created by didi on 10/10/2023.
//

import MiamIOSFramework

/**
 A class implementing the necessary parameters for the Meal Planner Recap
 
 Mandatory Parameters:
 - onNavigateAwayFromMealPlanner: () -> Void: A closure that navigates the user to somewhere else in the client app. The catalog, basket, home page. Up to the client.
 
 Optional Parameters:
 - viewOptions: ``MealPlannerRecapViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class MealPlannerRecapParameters: MealPlannerRecapParametersProtocol {
    public var onNavigateAwayFromMealPlanner: () -> Void
    
    public var success: TypeSafeMealPlannerRecap
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        onNavigateAwayFromMealPlanner: @escaping () -> Void,
        viewOptions: MealPlannerRecapViewOptions = MealPlannerRecapViewOptions()
    ) {
        self.onNavigateAwayFromMealPlanner = onNavigateAwayFromMealPlanner
        self.success = viewOptions.success
        self.background = viewOptions.background
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
    }
}
