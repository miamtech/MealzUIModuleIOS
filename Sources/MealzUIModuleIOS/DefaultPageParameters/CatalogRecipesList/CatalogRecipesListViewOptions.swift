//
//  CatalogRecipesListViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MealzIOSFramework

/**
 A protocol defining the necessary parameters for RecipeDetails
 
 - title:  An implementation of ``BaseTitleProtocol``
 - recipeCard:  An implementation of ``CatalogRecipeCardProtocol``
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``
 - noResults:  An implementation of ``CatalogRecipesListNoResultsProtocol``
 - loading: An implementation of ``LoadingProtocol``
 
 */
@available(iOS 14, *)
public struct CatalogRecipesListViewOptions {
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var title: TypeSafeBaseTitle
    public var noResults: TypeSafeCatalogRecipesListNoResults
    public var loading: TypeSafeLoading
    
    public init(
        recipeCard: TypeSafeCatalogRecipeCard = TypeSafeCatalogRecipeCard(MealzRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading()),
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(MealzCatalogPackageTitle()),
        noResults: TypeSafeCatalogRecipesListNoResults = TypeSafeCatalogRecipesListNoResults(MealzCatalogRecipesListNoResults()),
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView())
    ) {
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
        self.title = title
        self.noResults = noResults
        self.loading = loading
    }
}
