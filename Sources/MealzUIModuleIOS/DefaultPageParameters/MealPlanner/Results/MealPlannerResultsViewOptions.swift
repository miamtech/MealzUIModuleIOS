//
//  MealPlannerResultsViewOptions.swift
//  
//
//  Created by didi on 20/10/2023.
//

import MealzIOSFramework

/**
 An object containing all the views for the Meal Planner Results Page. If nothing is passed in, the Miam Default will be used
 
 - toolbar:  An implementation of ``MealPlannerResultsToolbarProtocol``
 - footer:  An implementation of ``MealPlannerResultsFooterProtocol``
 - recipeCard:  An implementation of ``CatalogRecipeCardProtocol``
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``
 - placeholder:  An implementation of ``MealPlannerRecipePlaceholderProtocol``
 - emptyResults:  An implementation of ``MealPlannerResultsEmptyProtocol``


 */
@available(iOS 14, *)
public struct MealPlannerResultsViewOptions {
    public var toolbar: TypeSafeMealPlannerResultsToolbar
    public var footer: TypeSafeMealPlannerResultsFooter
    public var recipeCard: TypeSafeMealPlannerRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var placeholder: TypeSafeMealPlannerRecipePlaceholder
    public var emptyResults: TypeSafeMealPlannerResultsEmpty
    
    public init(
        toolbar: TypeSafeMealPlannerResultsToolbar = TypeSafeMealPlannerResultsToolbar(MealzMealPlannerResultsToolbar()),
        footer: TypeSafeMealPlannerResultsFooter = TypeSafeMealPlannerResultsFooter(MealzMealPlannerStickyFooter()),
        recipeCard: TypeSafeMealPlannerRecipeCard = TypeSafeMealPlannerRecipeCard(MealzMealPlannerRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzMealPlannerRecipeCardLoading()),
        placeholder: TypeSafeMealPlannerRecipePlaceholder = TypeSafeMealPlannerRecipePlaceholder(MealzMealPlannerRecipePlaceholder()),
        emptyResults: TypeSafeMealPlannerResultsEmpty = TypeSafeMealPlannerResultsEmpty(MealzMealPlannerResultsEmpty())
    ) {
        self.toolbar = toolbar
        self.footer = footer
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
        self.placeholder = placeholder
        self.emptyResults = emptyResults
    }
}
