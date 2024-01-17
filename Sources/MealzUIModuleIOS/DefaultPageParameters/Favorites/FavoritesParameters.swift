//
//  FavoritesParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import MiamIOSFramework

/**
 A class implementing the necessary parameters for the Favorites Page.
 
 Mandatory Parameters:
 - onShowRecipeDetails: (String) -> Void: A closure that opens the RecipeDetails, passing in the recipeId
 - onNoResultsRedirect: () -> Void: A closure that navigates the user to a different page when the user doesn't have any favorite options. This should usually navigate to the CatalogView
 - onRecipeCallToActionTapped: (String) -> Void: A closure that executes the function in the "Call To Action" of the recipe card. This is usally "add to basket", so the navigation is to the Basket
 
 Optional Parameters:
 - viewOptions: ``FavoritesViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class FavoritesParameters: FavoritesParametersProtocol {
    public var onNoResultsRedirect: () -> Void
    public var onShowRecipeDetails: (String) -> Void
    public var onRecipeCallToActionTapped: (String) -> Void
    
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        onNoResultsRedirect: @escaping () -> Void,
        onShowRecipeDetails: @escaping (String) -> Void,
        onRecipeCallToActionTapped: @escaping (String) -> Void,
        viewOptions: FavoritesViewOptions = FavoritesViewOptions()
    ) {
        self.onNoResultsRedirect = onNoResultsRedirect
        self.onShowRecipeDetails = onShowRecipeDetails
        self.onRecipeCallToActionTapped = onRecipeCallToActionTapped
        self.recipeCard = viewOptions.recipeCard
        self.recipeCardLoading = viewOptions.recipeCardLoading
        
    }
}
