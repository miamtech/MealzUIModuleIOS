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
    public var itemSelectorCTA: TypeSafeBaseButton
    public var recipeCard: TypeSafeMyMealRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(MealzMyMealsTitle()),
        itemSelectorCTA: TypeSafeBaseButton = TypeSafeBaseButton(EmptyButtonView()),
        recipeCard: TypeSafeMyMealRecipeCard = TypeSafeMyMealRecipeCard(MealzMyMealRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading())
    ) {
        self.title = title
        self.itemSelectorCTA = itemSelectorCTA
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
    }
}

@available(iOS 14, *)
public extension MyMealsViewOptions {
    public init(nestedOptions: NestedMyMealsViewOptions) {
        self.title = nestedOptions.title
        self.itemSelectorCTA = nestedOptions.itemSelectorCTA
        self.recipeCard = nestedOptions.recipeCard
        self.recipeCardLoading = nestedOptions.recipeCardLoading
    }
}
