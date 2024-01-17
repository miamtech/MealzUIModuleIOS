//
//  MealPlannerResultsParameters.swift
//
//
//  Created by didi on 10/10/2023.
//

import SwiftUI
import MiamIOSFramework

/**
 A class implementing the necessary parameters for the Meal Planner Results
 
 Mandatory Parameters:
 - onShowRecipeDetails: (String) -> Void: A closure that opens the RecipeDetails, passing in the recipeId
 - onOpenReplaceRecipe: (Int) -> Void: A closure that opens the MealPlanner RecipePicker Page where users can replace the tapped recipe.
 - onNavigateToBasket: () -> Void: A closure that navigates the user to the Meal Planner Basket Page where they can edit the products in their basket.
 
 Optional Parameters:
 - viewOptions: ``MealPlannerResultsViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class MealPlannerResultsParameters: MealPlannerResultsParametersProtocol {
    public var onShowRecipeDetails: (String) -> Void
    public var onOpenReplaceRecipe: (Int) -> Void
    public var onNavigateToBasket: () -> Void
    
    public var toolbar: TypeSafeMealPlannerResultsToolbar
    public var footer: TypeSafeMealPlannerResultsFooter
    public var recipeCard: TypeSafeMealPlannerRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var placeholder: TypeSafeMealPlannerRecipePlaceholder
    public var emptyResults: TypeSafeMealPlannerResultsEmpty
    
    public init(
        onShowRecipeDetails: @escaping (String) -> Void,
        onOpenReplaceRecipe: @escaping (Int) -> Void,
        onNavigateToBasket: @escaping () -> Void,
        viewOptions: MealPlannerResultsViewOptions = MealPlannerResultsViewOptions()
    ) {
        self.onShowRecipeDetails = onShowRecipeDetails
        self.onOpenReplaceRecipe = onOpenReplaceRecipe
        self.onNavigateToBasket = onNavigateToBasket
        self.toolbar = viewOptions.toolbar
        self.footer = viewOptions.footer
        self.recipeCard = viewOptions.recipeCard
        self.recipeCardLoading = viewOptions.recipeCardLoading
        self.placeholder = viewOptions.placeholder
        self.emptyResults = viewOptions.emptyResults
    }
}
