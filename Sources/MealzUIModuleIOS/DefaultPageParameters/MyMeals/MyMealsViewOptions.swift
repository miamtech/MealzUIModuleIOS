//
//  MyMealsViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 The optional View parameters for MyMeals. If nothing is passed in, the Miam Default will be used
 
 - recipeCard:  An implementation of ``MyMealRecipeCardProtocol``
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``

 
 */
@available(iOS 14, *)
public struct MyMealsViewOptions {
    public var recipeCard: TypeSafeMyMealRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    
    public init(
        recipeCard: TypeSafeMyMealRecipeCard = TypeSafeMyMealRecipeCard(MealzMyMealRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading())
    ) {
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
        
    }
}
