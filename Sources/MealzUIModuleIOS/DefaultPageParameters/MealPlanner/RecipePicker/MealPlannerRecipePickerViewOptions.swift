//
//  MealPlannerRecipePickerViewOptions.swift
//  
//
//  Created by didi on 20/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the Meal Planner Recipe Picker Page. If nothing is passed in, the Miam Default will be used
 
 - search:  An implementation of ``SearchProtocol``
 - recipeCard:  An implementation of ``CatalogRecipeCardProtocol``
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``


 */
@available(iOS 14, *)
public struct MealPlannerRecipePickerViewOptions {
    public var search: TypeSafeSearch
    public var noResults: TypeSafeCatalogRecipesListNoResults
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        search: TypeSafeSearch = TypeSafeSearch(MealzMealPlannerSearch()),
        noResults: TypeSafeCatalogRecipesListNoResults = TypeSafeCatalogRecipesListNoResults(MealzCatalogRecipesListNoResults()),
        recipeCard: TypeSafeCatalogRecipeCard = TypeSafeCatalogRecipeCard(MealzRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading())
    ) {
        self.search = search
        self.noResults = noResults
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
    }
}
