//
//  MealPlannerRecapViewOptions.swift
//  
//
//  Created by didi on 20/10/2023.
//

import MealzIOSFramework

/**
 An object containing all the views for the Meal Planner Recap Page. If nothing is passed in, the Miam Default will be used
 
 - success:  An implementation of ``MealPlannerRecapProtocol`` which displays the total price spent
 - background: An implementation of ``BackgroundProtocol``

 */
@available(iOS 14, *)
public struct MealPlannerRecapViewOptions {
    public var success: TypeSafeMealPlannerRecap
    public var background: TypeSafeBackground
    
    public init(
        success: TypeSafeMealPlannerRecap = TypeSafeMealPlannerRecap(MealzMealPlannerRecap()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.success = success
        self.background = background
    }
}
