//
//  MealPlannerFormViewOptions.swift
//  
//
//  Created by didi on 20/10/2023.
//

import MealzIOSFramework

/**
 An object containing all the views for the Meal Planner Form Page. If nothing is passed in, the Miam Default will be used
 
 - form:  An implementation of ``MealPlannerFormProtocol``

 */
@available(iOS 14, *)
public struct MealPlannerFormViewOptions {
    public var form: TypeSafeMealPlannerForm
    
    public init(
        form: TypeSafeMealPlannerForm = TypeSafeMealPlannerForm(MealzMealPlannerForm())
    ) {
        self.form = form
    }
}
