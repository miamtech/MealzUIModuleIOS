//
//  BasketRecipeParameters.swift
//
//
//  Created by didi on 05/10/2023.
//

import SwiftUI
import MiamIOSFramework

/**
 A class implementing the necessary parameters for the BasketRecipe
 
 Mandatory Parameters:
 - onShowRecipeDetails: (String) -> Void: A closure that opens the RecipeDetails, passing in the recipeId
 - onReplaceProduct: (String) -> Void: A closure that opens the ItemSelector page where a user can replace an ingredient with a different product from a different brand. This will navigate to a standalone page of ItemSelector.
 
 Optional Parameters:
 - viewOptions: ``BasketRecipeViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
/// This sets the Callbacks for the BasketRecipe Overview
public class BasketRecipeParameters: BasketRecipeParametersProtocol {
    
    public var actions: BasketRecipeActions
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
        actions: BasketRecipeActions,
        viewOptions: BasketRecipeViewOptions = BasketRecipeViewOptions()
    ) {
        self.actions = actions
        self.recipeOverview = viewOptions.recipeOverview
        self.recipeOverviewLoading = viewOptions.recipeOverviewLoading
        self.basketProduct = viewOptions.basketProduct
        self.ingredientsAtHomeToggleButton = viewOptions.ingredientsAtHomeToggleButton
        self.removedIngredientsToggleButton = viewOptions.removedIngredientsToggleButton
        self.unavailableIngredientsToggleButton = viewOptions.unavailableIngredientsToggleButton
        self.ingredientsAtHome = viewOptions.ingredientsAtHome
        self.removedIngredients = viewOptions.removedIngredients
        self.unavailableIngredients = viewOptions.unavailableIngredients
    }
}
