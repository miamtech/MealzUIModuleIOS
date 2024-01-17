//
//  CatalogRecipesListParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import MiamIOSFramework

/**
 A class implemening the necessary parameters for the CatalogRecipesList.
 
 Mandatory Parameters:
 - onShowRecipeDetails: (String) -> Void: A closure that opens the RecipeDetails, passing in the recipeId
 - onNoResultsRedirect: () -> Void: A closure that can be used to navigate users somewhere else if their search or filter has no results
 - onRecipeCallToActionTapped: (String) -> Void: A closure that executes the callback in the recipeCard CTA. This is often a navigation to the Basket, but it can also be used on MealPlanner to navigate back to the MealPlanner Results
 
 Optional Parameters:
 - viewOptions: ``CatalogRecipesListViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class CatalogRecipesListParameters: CatalogRecipesListParametersProtocol {
    public var onNoResultsRedirect: () -> Void
    public var onShowRecipeDetails: (String) -> Void
    public var onRecipeCallToActionTapped: (String) -> Void
    
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var title: TypeSafeBaseTitle
    public var noResults: TypeSafeCatalogRecipesListNoResults
    public var loading: TypeSafeLoading
    
    public init(
        onNoResultsRedirect: @escaping () -> Void,
        onShowRecipeDetails: @escaping (String) -> Void,
        onRecipeCallToActionTapped: @escaping (String) -> Void,
        viewOptions: CatalogRecipesListViewOptions = CatalogRecipesListViewOptions()
    ) {
        self.onNoResultsRedirect = onNoResultsRedirect
        self.onShowRecipeDetails = onShowRecipeDetails
        self.onRecipeCallToActionTapped = onRecipeCallToActionTapped
        self.recipeCard = viewOptions.recipeCard
        self.recipeCardLoading = viewOptions.recipeCardLoading
        self.title = viewOptions.title
        self.noResults = viewOptions.noResults
        self.loading = viewOptions.loading
    }
}
