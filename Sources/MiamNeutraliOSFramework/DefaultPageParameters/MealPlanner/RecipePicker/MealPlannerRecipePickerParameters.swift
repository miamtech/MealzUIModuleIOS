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
    public var onShowRecipeDetails: (String) -> Void
    public var onSelectRecipeForMealPlanner: (String) -> Void
    public var onOpenFiltersOptions: (SingletonFilterViewModel) -> Void
    
    public var search: TypeSafeSearch
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        onShowRecipeDetails: @escaping (String) -> Void,
        onSelectRecipeForMealPlanner: @escaping (String) -> Void,
        onOpenFiltersOptions: @escaping (SingletonFilterViewModel) -> Void,
        viewOptions: MealPlannerRecipePickerViewOptions = MealPlannerRecipePickerViewOptions()
    ) {
        self.onShowRecipeDetails = onShowRecipeDetails
        self.onSelectRecipeForMealPlanner = onSelectRecipeForMealPlanner
        self.onOpenFiltersOptions = onOpenFiltersOptions
        self.search = viewOptions.search
        self.recipeCard = viewOptions.recipeCard
        self.recipeCardLoading = viewOptions.recipeCardLoading
        self.background = viewOptions.background
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
    }
}