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
    public var actions: FavoritesActions
    
    public var title: TypeSafeBaseTitle
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        actions: FavoritesActions,
        viewOptions: FavoritesViewOptions = FavoritesViewOptions()
    ) {
        self.actions = actions
        self.recipeCard = viewOptions.recipeCard
        self.recipeCardLoading = viewOptions.recipeCardLoading
        self.title = viewOptions.title
    }
}
