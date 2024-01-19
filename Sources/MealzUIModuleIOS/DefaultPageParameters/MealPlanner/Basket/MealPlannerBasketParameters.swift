//
//  MealPlannerBasketParameters.swift
//  
//
//  Created by didi on 10/10/2023.
//

import SwiftUI
import MiamIOSFramework

/**
 A class implementing the necessary parameters for the Meal Planner Basket
 
 Mandatory Parameters:
 - onNavigateToRecap: () -> Void: A closure that navigates the user to the Meal Planner Recap page
 - onNavigateToBasket: () -> Void: A closure that navigates the user directly to their Basket to see what has been added to their cart
 
 Optional Parameters:
 - viewOptions: ``MealPlannerBasketViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class MealPlannerBasketParameters: MealPlannerBasketParametersProtocol {
    public var actions: MealPlannerBasketActions
    
    public var footer: TypeSafeMealPlannerBasketFooter
    
    public init(
        actions: MealPlannerBasketActions,
        viewOptions: MealPlannerBasketViewOptions = MealPlannerBasketViewOptions()
    ) {
        self.actions = actions
        self.footer = viewOptions.footer
    }
}
