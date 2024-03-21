//
//  MyMealsViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MealzIOSFramework

/**
 The optional View parameters for MyMeals. If nothing is passed in, the Miam Default will be used
 
 - title:  An implementation of ``BaseTitleProtocol``
 - recipeCard:  An implementation of ``MyMealRecipeCardProtocol``
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``

 */
@available(iOS 14, *)
public struct MyMealsViewOptions {
    public var title: TypeSafeBaseTitle
    public var recipeCard: TypeSafeMyMealRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(MealzMyMealsTitle()),
        recipeCard: TypeSafeMyMealRecipeCard = TypeSafeMyMealRecipeCard(MealzMyMealRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading())
    ) {
        self.title = title
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
    }
}
