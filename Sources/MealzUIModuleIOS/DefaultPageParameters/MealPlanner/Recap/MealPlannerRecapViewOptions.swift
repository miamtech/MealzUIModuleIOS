//
//  MealPlannerRecapViewOptions.swift
//  
//
//  Created by didi on 20/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the Meal Planner Recap Page. If nothing is passed in, the Miam Default will be used
 
 - success:  An implementation of ``MealPlannerRecapProtocol`` which displays the total price spent
 - background: An implementation of ``BackgroundProtocol``

 */
@available(iOS 14, *)
public struct MealPlannerRecapViewOptions {
    public var success: TypeSafeMealPlannerRecap
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        success: TypeSafeMealPlannerRecap = TypeSafeMealPlannerRecap(MealzMealPlannerRecap()),
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView()),
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.success = success
        self.background = background
        self.empty = empty
        self.loading = loading
    }
}
