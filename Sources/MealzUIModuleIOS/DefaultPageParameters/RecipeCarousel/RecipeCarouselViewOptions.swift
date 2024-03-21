//
//  RecipeCarouselViewOptions.swift
//  
//
//  Created by didi on 16/10/2023.
//

import MealzIOSFramework

/**
 An object containing all the views for the Recipe Carousel. If nothing is passed in, the Miam Default will be used
 
 - recipeCard:  An implementation of ``CatalogRecipeCardProtocol``
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``

 */
@available(iOS 14, *)
public struct RecipeCarouselViewOptions {
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        recipeCard: TypeSafeCatalogRecipeCard = TypeSafeCatalogRecipeCard(MealzRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading())
    ) {
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
    }
}
