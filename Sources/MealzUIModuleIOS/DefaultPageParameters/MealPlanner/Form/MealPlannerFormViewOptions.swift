//
//  MealPlannerFormViewOptions.swift
//  
//
//  Created by didi on 20/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the Meal Planner Form Page. If nothing is passed in, the Miam Default will be used
 
 - form:  An implementation of ``MealPlannerFormProtocol``
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 - background: An implementation of ``BackgroundProtocol``

 */
@available(iOS 14, *)
public struct MealPlannerFormViewOptions {
    public var form: TypeSafeMealPlannerForm
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        form: TypeSafeMealPlannerForm = TypeSafeMealPlannerForm(MealzMealPlannerForm()),
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView()),
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.form = form
        self.background = background
        self.empty = empty
        self.loading = loading
    }
}
