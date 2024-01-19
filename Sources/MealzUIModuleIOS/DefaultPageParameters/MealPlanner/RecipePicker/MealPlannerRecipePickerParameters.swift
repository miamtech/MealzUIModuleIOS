//
//  MealPlannerRecipePickerParameters.swift
//  
//
//  Created by didi on 10/10/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

/**
 A class implementing the necessary parameters for the Meal Planner Recipe Picker
 
 Mandatory Parameters:
 - onShowRecipeDetails: (String) -> Void: A closure that opens the RecipeDetails, passing in the recipeId
 - onSelectRecipeForMealPlanner: (String) -> Void: A closure that  selects the current recipe for the meal planner & navigates the user back to the Meal Planner Results page
 - onOpenFiltersOptions: (SingletonFilterViewModel) -> Void: A closure that navigates the user to the Filters page, passing in the MealPlanner Filters View Model
 
 Optional Parameters:
 - viewOptions: ``MealPlannerRecipePickerViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class MealPlannerRecipePickerParameters: MealPlannerRecipePickerParametersProtocol {
    public var actions: MealPlannerRecipePickerActions
    
    public var search: TypeSafeSearch
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        actions: MealPlannerRecipePickerActions,
        viewOptions: MealPlannerRecipePickerViewOptions = MealPlannerRecipePickerViewOptions()
    ) {
        self.actions = actions
        self.search = viewOptions.search
        self.recipeCard = viewOptions.recipeCard
        self.recipeCardLoading = viewOptions.recipeCardLoading
    }
}
