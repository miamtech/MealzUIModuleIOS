//
//  FavoritesViewOptions.swift
//  
//
//  Created by didi on 16/10/2023.
//

import MealzIOSFramework

/**
 An object containing all the views for the Favorites Page. If nothing is passed in, the Miam Default will be used
 
 - recipeCard:  An implementation of ``CatalogRecipeCardProtocol``
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``


 */
@available(iOS 14, *)
public struct FavoritesViewOptions {
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var title: TypeSafeBaseTitle
    
    public init(
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(MealzFavoritesTitle()),
        recipeCard: TypeSafeCatalogRecipeCard = TypeSafeCatalogRecipeCard(MealzRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading())
    ) {
        self.title = title
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
    }
}
