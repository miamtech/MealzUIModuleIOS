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
    public var ignoredProduct: TypeSafeRecipeDetailsIgnoredProducts
    public var unaddedProduct: TypeSafeRecipeDetailsUnaddedProducts
    public var addedProduct: TypeSafeRecipeDetailsAddedProducts
    public var loadingProduct: TypeSafeLoading
    public var tags: TypeSafeRecipeDetailsTags
    public var ingredients: TypeSafeRecipeDetailsIngredients
    public var steps: TypeSafeRecipeDetailsSteps
    public var footer: TypeSafeRecipeDetailsFooter
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        onClosed: @escaping () -> Void,
        onSponsorDetailsTapped: @escaping (Sponsor) -> Void,
        onContinueToBasket: (() -> Void)? = nil,
        onReplaceProduct: @escaping (String) -> Void,
        viewOption: RecipeDetailsViewOptions = RecipeDetailsViewOptions()
    ) {
        self.onClosed = onClosed
        self.onSponsorDetailsTapped = onSponsorDetailsTapped
        self.onContinueToBasket = onContinueToBasket
        self.onReplaceProduct = onReplaceProduct
        
        self.header = viewOption.header
        self.sponsor = viewOption.sponsor
        self.ingredients = viewOption.ingredients
        self.steps = viewOption.steps
        self.footer = viewOption.footer
        self.background = viewOption.background
        self.empty = viewOption.empty
        self.loading = viewOption.loading
        self.selectedControl = viewOption.selectedControl
        self.tags = viewOption.tags
        
        self.ignoredProduct = viewOption.ignoredProduct
        self.unaddedProduct = viewOption.unaddedProduct
        self.addedProduct = viewOption.addedProduct
        self.loadingProduct = viewOption.loadingProduct
    }
}
