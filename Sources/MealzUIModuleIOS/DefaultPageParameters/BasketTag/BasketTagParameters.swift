//
//  BasketTagParameters.swift
//  
//
//  Created by didi on 16/10/2023.
//

import MiamIOSFramework

/**
 A class implementing the necessary parameters for the Basket Tag
 
 Mandatory Parameters:
 - onShowRecipeDetails: (String) -> Void: A closure that opens the RecipeDetails, passing in the recipeId
 
 Optional Parameters:
 - viewOptions: ``BasketTagViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class BasketTagParameters: BasketTagParametersProtocol {
    
    public var onShowRecipeDetails: (String) -> Void
    
    public var title: TypeSafeBaseTitle
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        onShowRecipeDetails: @escaping (String) -> Void,
        viewOptions: BasketTagViewOptions = BasketTagViewOptions()
    ) {
        self.onShowRecipeDetails = onShowRecipeDetails
        self.title = viewOptions.title
        self.background = viewOptions.background
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
    }
}

