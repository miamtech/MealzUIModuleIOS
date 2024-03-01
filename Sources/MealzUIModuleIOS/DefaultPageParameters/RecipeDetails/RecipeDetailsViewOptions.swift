//
//  RecipeDetailsViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 A protocol defining the necessary parameters for RecipeDetails
 
 - header:  An implementation of ``RecipeDetailsHeaderProtocol``. The content of the header in the recipe details.
 - sponsor:  An implementation of ``RecipeDetailsSponsorProtocol``. The content of the sponsor button in the recipe details.
 - ingredients:  An implementation of ``RecipeDetailsIngredientsProtocol``. The content of the ingredients list in the recipe details.
 - steps:  An implementation of ``RecipeDetailsStepsProtocol``. The content of the steps in the recipe details.
 - footer:  An implementation of ``RecipeDetailsFooterProtocol``. TThe content of the footer in the recipe details.
`
 
 */
@available(iOS 14, *)
public struct RecipeDetailsViewOptions {
    public var header: TypeSafeRecipeDetailsHeader
    public var sponsor: TypeSafeRecipeDetailsSponsor
    public var numberOfIngredientsTitle: TypeSafeBaseTitle
    public var selectedControl: TypeSafeRecipeDetailsSelectedControl
    public var ingredients: TypeSafeRecipeDetailsIngredients
    public var steps: TypeSafeRecipeDetailsSteps
    public var footer: TypeSafeRecipeDetailsFooter
    
    public var ingredientsAtHomeToggleButton: TypeSafeBaseButton
    public var unavailableIngredientsToggleButton: TypeSafeBaseButton
    
    public var ingredientsAtHome: TypeSafeNotInBasketProduct
    public var unavailableIngredients: TypeSafeNotInBasketProduct

    public init(
        header: TypeSafeRecipeDetailsHeader = TypeSafeRecipeDetailsHeader(MealzRecipeDetailsHeaderView()),
        sponsor: TypeSafeRecipeDetailsSponsor = TypeSafeRecipeDetailsSponsor(MealzRecipeDetailsSponsor()),
        selectedControl: TypeSafeRecipeDetailsSelectedControl = TypeSafeRecipeDetailsSelectedControl(MealzRecipeDetailsSelectedControlView()),
        numberOfIngredientsTitle: TypeSafeBaseTitle = TypeSafeBaseTitle(MealzRecipeDetailsNumberOfIngredientsTitleView()),
        ingredients: TypeSafeRecipeDetailsIngredients = TypeSafeRecipeDetailsIngredients(MealzRecipeDetailsIngredientsView()),
        steps: TypeSafeRecipeDetailsSteps = TypeSafeRecipeDetailsSteps(MealzRecipeDetailsStepsView()),
        footer: TypeSafeRecipeDetailsFooter = TypeSafeRecipeDetailsFooter(MealzRecipeDetailsFooterView()),
        ingredientsAtHomeToggleButton: TypeSafeBaseButton = TypeSafeBaseButton(MealzNotInBasketTitle()),
        unavailableIngredientsToggleButton: TypeSafeBaseButton = TypeSafeBaseButton(MealzNotInBasketTitle()),
        ingredientsAtHome: TypeSafeNotInBasketProduct = TypeSafeNotInBasketProduct(MealzNotInBasketProduct()),
        unavailableIngredients: TypeSafeNotInBasketProduct = TypeSafeNotInBasketProduct(MealzNotInBasketProduct())
    ) {
        self.header = header
        self.sponsor = sponsor
        self.selectedControl = selectedControl
        self.numberOfIngredientsTitle = numberOfIngredientsTitle
        self.ingredients = ingredients
        self.steps = steps
        self.footer = footer
        
        self.ingredientsAtHomeToggleButton = ingredientsAtHomeToggleButton
        self.unavailableIngredientsToggleButton = unavailableIngredientsToggleButton
        
        self.ingredientsAtHome = ingredientsAtHome
        self.unavailableIngredients = unavailableIngredients
    }
}
