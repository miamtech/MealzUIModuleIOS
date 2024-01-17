//
//  MealPlannerBasketViewOptions.swift
//  
//
//  Created by didi on 20/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the Meal Planner Basket Page. If nothing is passed in, the Miam Default will be used
 
 - footer:  An implementation of ``MealPlannerBasketFooterProtocol``
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 - background: An implementation of ``BackgroundProtocol``

 */
@available(iOS 14, *)
public struct MealPlannerBasketViewOptions {
    public var footer: TypeSafeMealPlannerBasketFooter
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        footer: TypeSafeMealPlannerBasketFooter = TypeSafeMealPlannerBasketFooter(MealzMealPlannerBasketPreviewFooter()),
        empty: TypeSafeEmpty = TypeSafeEmpty(MealzGeneralEmpty()),
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.footer = footer
        self.background = background
        self.empty = empty
        self.loading = loading
    }
}
