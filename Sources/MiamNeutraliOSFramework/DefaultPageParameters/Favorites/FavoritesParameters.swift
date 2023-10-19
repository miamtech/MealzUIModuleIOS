//
//  FavoritesParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import MiamIOSFramework

@available(iOS 14, *)
/// This sets the Templates for the Favorites Overview
public class FavoritesParameters: FavoritesParametersProtocol {
    
    public var onNoResultsRedirect: () -> Void
    public var onShowRecipeDetails: (String) -> Void
    public var onRecipeCallToActionTapped: (String) -> Void
    
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
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
        self.background = viewOptions.background
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
    }
}
