//
//  RecipeDetailParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import MiamIOSFramework
import miamCore

/**
 A class implemening the necessary parameters for the PreferencesSearch Page.
 
 Mandatory Parameters:
 - onClosed: () -> Void: A closure that is called when the close button is pressed.
 - onSponsorDetailsTapped: (Sponsor) -> Void: A closure that is called when the sponsor details button is pressed.
 - onContinueToBasket: (() -> Void)?: An optional closure that is called when the continue to basket button is pressed.
 
 Optional Parameters:
 - viewOptions: ``RecipeDetailsViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */

@available(iOS 14, *)
public class RecipeDetailParameters: RecipeDetailsParametersProtocol {
    
    public var onClosed: () -> Void
    public var onSponsorDetailsTapped: (Sponsor) -> Void
    public var onContinueToBasket: (() -> Void)?
    public var onReplaceProduct: (String) -> Void
    
    public var header: TypeSafeRecipeDetailsHeader
    public var sponsor: TypeSafeRecipeDetailsSponsor
    public var selectedControl: TypeSafeRecipeDetailsSelectedControl
    public var ingredients: TypeSafeRecipeDetailsIngredients
    public var steps: TypeSafeRecipeDetailsSteps
    public var footer: TypeSafeRecipeDetailsFooter
    
    public var ingredientsAtHomeToggleButton: TypeSafeBaseButton
    public var unavailableIngredientsToggleButton: TypeSafeBaseButton
    public var ingredientsAtHome: TypeSafeNotInBasketProduct
    public var unavailableIngredients: TypeSafeNotInBasketProduct
    
    public init(
        onClosed: @escaping () -> Void,
        onSponsorDetailsTapped: @escaping (Sponsor) -> Void,
        onContinueToBasket: (() -> Void)? = nil,
        onReplaceProduct: @escaping (String) -> Void,
        viewOptions: RecipeDetailsViewOptions = RecipeDetailsViewOptions()
    ) {
        self.onClosed = onClosed
        self.onSponsorDetailsTapped = onSponsorDetailsTapped
        self.onContinueToBasket = onContinueToBasket
        self.onReplaceProduct = onReplaceProduct
        
        self.header = viewOptions.header
        self.sponsor = viewOptions.sponsor
        self.ingredients = viewOptions.ingredients
        self.steps = viewOptions.steps
        self.footer = viewOptions.footer
        self.selectedControl = viewOptions.selectedControl
        
        self.ingredientsAtHomeToggleButton = viewOptions.ingredientsAtHomeToggleButton
        self.unavailableIngredientsToggleButton = viewOptions.unavailableIngredientsToggleButton
        self.ingredientsAtHome = viewOptions.ingredientsAtHome
        self.unavailableIngredients = viewOptions.unavailableIngredients
    }
}
