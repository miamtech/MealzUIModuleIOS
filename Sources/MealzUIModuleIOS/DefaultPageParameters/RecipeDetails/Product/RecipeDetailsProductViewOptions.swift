//
//  RecipeDetailsProductViewOptions.swift
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
public struct RecipeDetailsProductViewOptions {
    public var ignoredProduct: TypeSafeRecipeDetailsIgnoredProduct
    public var unaddedProduct: TypeSafeRecipeDetailsUnaddedProduct
    public var addedProduct: TypeSafeRecipeDetailsAddedProduct
    public var loadingProduct: TypeSafeLoading

    public init(
        ignoredProduct: TypeSafeRecipeDetailsIgnoredProduct = TypeSafeRecipeDetailsIgnoredProduct(MealzRecipeDetailsIgnoredProductView()),
        unaddedProduct: TypeSafeRecipeDetailsUnaddedProduct = TypeSafeRecipeDetailsUnaddedProduct(MealzRecipeDetailsUnaddedProductView()),
        addedProduct: TypeSafeRecipeDetailsAddedProduct = TypeSafeRecipeDetailsAddedProduct(MealzRecipeDetailsAddedProductView()),
        loadingProduct: TypeSafeLoading = TypeSafeLoading(MealzRecipeDetailsLoadingProductView())
    ) {
        self.ignoredProduct = ignoredProduct
        self.unaddedProduct = unaddedProduct
        self.addedProduct = addedProduct
        self.loadingProduct = loadingProduct
    }
}
