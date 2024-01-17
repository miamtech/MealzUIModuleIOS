//
//  BasketRecipeViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the BasketRecipe. If nothing is passed in, the Miam Default will be used
 
 - recipeOverview:  An implementation of ``BasketRecipeOverviewProtocol``
 - recipeOverviewLoading:  An implementation of ``RecipeCardLoadingProtocol``
 - basketProduct:  An implementation of ``BasketProductProtocol``
 - ingredientsAtHomeToggleButton:  An implementation of ``BaseButtonProtocol``
 - removedIngredientsToggleButton: An implementation of ``BaseButtonProtocol``
 - unavailableIngredientsToggleButton: An implementation of ``BaseButtonProtocol``
 - ingredientsAtHome:  An implementation of ``NotInBasketProductProtocol``
 - removedIngredients: An implementation of ``NotInBasketProductProtocol``
 - unavailableIngredients: An implementation of ``NotInBasketProductProtocol``
 
 */
@available(iOS 14, *)
public struct BasketRecipeViewOptions {
    public var recipeOverview: TypeSafeBasketRecipeOverview
    public var recipeOverviewLoading: TypeSafeRecipeCardLoading
    public var basketProduct: TypeSafeBasketProduct
    
    public var ingredientsAtHomeToggleButton: TypeSafeBaseButton
    public var removedIngredientsToggleButton: TypeSafeBaseButton
    public var unavailableIngredientsToggleButton: TypeSafeBaseButton
    
    public var ingredientsAtHome: TypeSafeNotInBasketProduct
    public var removedIngredients: TypeSafeNotInBasketProduct
    public var unavailableIngredients: TypeSafeNotInBasketProduct
    
    public init(
        recipeOverview: TypeSafeBasketRecipeOverview = TypeSafeBasketRecipeOverview(MealzBasketRecipeOverview()),
        recipeOverviewLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading()),
        basketProduct: TypeSafeBasketProduct = TypeSafeBasketProduct(MealzBasketProduct()),
        ingredientsAtHomeToggleButton: TypeSafeBaseButton = TypeSafeBaseButton(MealzNotInBasketTitle()),
        removedIngredientsToggleButton: TypeSafeBaseButton = TypeSafeBaseButton(MealzNotInBasketTitle()),
        unavailableIngredientsToggleButton: TypeSafeBaseButton = TypeSafeBaseButton(MealzNotInBasketTitle()),
        ingredientsAtHome: TypeSafeNotInBasketProduct = TypeSafeNotInBasketProduct(MealzNotInBasketProduct()),
        removedIngredients: TypeSafeNotInBasketProduct = TypeSafeNotInBasketProduct(MealzNotInBasketProduct()),
        unavailableIngredients: TypeSafeNotInBasketProduct = TypeSafeNotInBasketProduct(MealzNotInBasketProduct())
    ) {
        self.recipeOverview = recipeOverview
        self.recipeOverviewLoading = recipeOverviewLoading
        self.basketProduct = basketProduct
        
        self.ingredientsAtHomeToggleButton = ingredientsAtHomeToggleButton
        self.removedIngredientsToggleButton = removedIngredientsToggleButton
        self.unavailableIngredientsToggleButton = unavailableIngredientsToggleButton
        
        self.ingredientsAtHome = ingredientsAtHome
        self.removedIngredients = removedIngredients
        self.unavailableIngredients = unavailableIngredients
    }
}
