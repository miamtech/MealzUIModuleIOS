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
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 - background: An implementation of ``BackgroundProtocol```
 
 */
@available(iOS 14, *)
public struct RecipeDetailsViewOptions {
    public var header: TypeSafeRecipeDetailsHeader
    public var sponsor: TypeSafeRecipeDetailsSponsor
    public var selectedControl: TypeSafeRecipeDetailsSelectedControl
    public var ingredients: TypeSafeRecipeDetailsIngredients
    public var steps: TypeSafeRecipeDetailsSteps
    public var footer: TypeSafeRecipeDetailsFooter
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public var ingredientsAtHomeToggleButton: TypeSafeBaseButton
    public var unavailableIngredientsToggleButton: TypeSafeBaseButton
    
    public var ingredientsAtHome: TypeSafeNotInBasketProduct
    public var unavailableIngredients: TypeSafeNotInBasketProduct

    public init(
        header: TypeSafeRecipeDetailsHeader = TypeSafeRecipeDetailsHeader(MealzRecipeDetailsHeaderView()),
        sponsor: TypeSafeRecipeDetailsSponsor = TypeSafeRecipeDetailsSponsor(MealzRecipeDetailsSponsor()),
        selectedControl: TypeSafeRecipeDetailsSelectedControl = TypeSafeRecipeDetailsSelectedControl(MealzRecipeDetailsSelectedControlView()),
        ingredients: TypeSafeRecipeDetailsIngredients = TypeSafeRecipeDetailsIngredients(MealzRecipeDetailsIngredientsView()),
        steps: TypeSafeRecipeDetailsSteps = TypeSafeRecipeDetailsSteps(MealzRecipeDetailsStepsView()),
        footer: TypeSafeRecipeDetailsFooter = TypeSafeRecipeDetailsFooter(MealzRecipeDetailsFooterView()),
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView()),
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView()),
        ingredientsAtHomeToggleButton: TypeSafeBaseButton = TypeSafeBaseButton(MealzNotInBasketTitle()),
        unavailableIngredientsToggleButton: TypeSafeBaseButton = TypeSafeBaseButton(MealzNotInBasketTitle()),
        ingredientsAtHome: TypeSafeNotInBasketProduct = TypeSafeNotInBasketProduct(MealzNotInBasketProduct()),
        unavailableIngredients: TypeSafeNotInBasketProduct = TypeSafeNotInBasketProduct(MealzNotInBasketProduct())
    ) {
        self.header = header
        self.sponsor = sponsor
        self.selectedControl = selectedControl
        self.ingredients = ingredients
        self.steps = steps
        self.footer = footer
        self.background = background
        self.empty = empty
        self.loading = loading
        
        self.ingredientsAtHomeToggleButton = ingredientsAtHomeToggleButton
        self.unavailableIngredientsToggleButton = unavailableIngredientsToggleButton
        
        self.ingredientsAtHome = ingredientsAtHome
        self.unavailableIngredients = unavailableIngredients
    }
}
