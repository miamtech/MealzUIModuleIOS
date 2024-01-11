//
//  RecipeDetailsProductParameters.swift
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
 - viewOptions: ``RecipeDetailsProductViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */

@available(iOS 14, *)
public class RecipeDetailsProductParameters: RecipeDetailsProductProtocol {
    public var onReplaceProduct: (String) -> Void
    
    public var ignoredProduct: TypeSafeRecipeDetailsIgnoredProduct
    public var unaddedProduct: TypeSafeRecipeDetailsUnaddedProduct
    public var addedProduct: TypeSafeRecipeDetailsAddedProduct
    public var loadingProduct: TypeSafeLoading
    
    public init(
        onReplaceProduct: @escaping (String) -> Void,
        viewOption: RecipeDetailsProductViewOptions = RecipeDetailsProductViewOptions()
    ) {
        self.onReplaceProduct = onReplaceProduct
        self.ignoredProduct = viewOption.ignoredProduct
        self.unaddedProduct = viewOption.unaddedProduct
        self.addedProduct = viewOption.addedProduct
        self.loadingProduct = viewOption.loadingProduct
    }
}
