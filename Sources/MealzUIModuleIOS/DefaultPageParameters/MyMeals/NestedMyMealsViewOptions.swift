//
//  File.swift
//  
//
//  Created by Antonin Francois on 28/03/2024.
//

import MealzIOSFramework

/**
 The optional View parameters for nested MyMeals. If nothing is passed in, the Mealz Default will be used
 
 - title:  An implementation of ``BaseTitleProtocol``
 - recipeCard:  An implementation of ``MyMealRecipeCardProtocol``
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``

 */
@available(iOS 14, *)
public struct NestedMyMealsViewOptions {
    public var title: TypeSafeBaseTitle
    public var itemSelectorCTA: TypeSafeBaseButton
    public var recipeCard: TypeSafeMyMealRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(EmptyTitleView()),
        itemSelectorCTA: TypeSafeBaseButton = TypeSafeBaseButton(MyBasketOpenItemSelectorCTA()),
        recipeCard: TypeSafeMyMealRecipeCard = TypeSafeMyMealRecipeCard(MealzMyMealRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading())
    ) {
        self.title = title
        self.itemSelectorCTA = itemSelectorCTA
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
    }
}
