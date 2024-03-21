//
//  MealPlannerBasketViewOptions.swift
//  
//
//  Created by didi on 20/10/2023.
//

import MealzIOSFramework

/**
 An object containing all the views for the Meal Planner Basket Page. If nothing is passed in, the Miam Default will be used
 
 - footer:  An implementation of ``MealPlannerBasketFooterProtocol``


 */
@available(iOS 14, *)
public struct MealPlannerBasketViewOptions {
    public var footer: TypeSafeMealPlannerBasketFooter
    
    public init(
        footer: TypeSafeMealPlannerBasketFooter = TypeSafeMealPlannerBasketFooter(MealzMealPlannerBasketPreviewFooter())
    ) {
        self.footer = footer
    }
}
