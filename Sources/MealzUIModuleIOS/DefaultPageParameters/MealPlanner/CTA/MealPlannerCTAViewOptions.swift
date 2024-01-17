//
//  MealPlannerCTAViewOptions.swift
//  
//
//  Created by didi on 20/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the Meal Planner CTA component. If nothing is passed in, the Miam Default will be used
 
 - callToAction:  An implementation of ``callToAction``

 */
@available(iOS 14, *)
public struct MealPlannerCTAViewOptions {
    public var callToAction: TypeSafeMealPlannerCTA
    
    public init(
        callToAction: TypeSafeMealPlannerCTA = TypeSafeMealPlannerCTA(MealzMealPlannerCallToAction())
    ) {
        self.callToAction = callToAction
    }
}
