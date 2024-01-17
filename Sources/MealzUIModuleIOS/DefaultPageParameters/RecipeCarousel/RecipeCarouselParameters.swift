//
//  RecipeCarouselParameters.swift
//  
//
//  Created by didi on 16/10/2023.
//

import MiamIOSFramework

/**
 A class implementing the necessary parameters for Recipe Carousel
 
 Mandatory Parameters:
 - onShowRecipeDetails: (String) -> Void: A closure that opens the RecipeDetails, passing in the recipeId
 - onRecipeCallToActionTapped: (String) -> Void: A closure that activates the CTA on the Recipe Card. This usually adds it to the Basket & navigates to the basket.
 
 Optional Parameters:
 - viewOptions: ``RecipeCarouselViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class RecipeCarouselParameters: RecipeCarouselParametersProtocol {
    public var onShowRecipeDetails: (String) -> Void
    public var onRecipeCallToActionTapped: (String) -> Void
    
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        onShowRecipeDetails: @escaping (String) -> Void,
        onRecipeCallToActionTapped: @escaping (String) -> Void,
        viewOptions: RecipeCarouselViewOptions = RecipeCarouselViewOptions()
    ) {
        self.onShowRecipeDetails = onShowRecipeDetails
        self.onRecipeCallToActionTapped = onRecipeCallToActionTapped
        self.recipeCard = viewOptions.recipeCard
        self.recipeCardLoading = viewOptions.recipeCardLoading
        self.background = viewOptions.background
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
    }
}
