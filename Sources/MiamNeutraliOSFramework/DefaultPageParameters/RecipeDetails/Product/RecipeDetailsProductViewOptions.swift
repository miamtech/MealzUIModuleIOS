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
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 - background: An implementation of ``BackgroundProtocol```
 
 */
@available(iOS 14, *)
public struct RecipeDetailsProductViewOptions {
    public var ignoredProduct: TypeSafeRecipeDetailsIgnoredProduct
    public var unaddedProduct: TypeSafeRecipeDetailsUnaddedProduct
    public var addedProduct: TypeSafeRecipeDetailsAddedProduct
    public var loadingProduct: TypeSafeLoading

    public init(
        ignoredProduct: TypeSafeRecipeDetailsIgnoredProduct = TypeSafeRecipeDetailsIgnoredProduct(MiamNeutralRecipeDetailsIgnoredProductView()),
        unaddedProduct: TypeSafeRecipeDetailsUnaddedProduct = TypeSafeRecipeDetailsUnaddedProduct(MiamNeutralRecipeDetailsUnaddedProductView()),
        addedProduct: TypeSafeRecipeDetailsAddedProduct = TypeSafeRecipeDetailsAddedProduct(MiamNeutralRecipeDetailsAddedProductView()),
        loadingProduct: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView())
    ) {
        self.ignoredProduct = ignoredProduct
        self.unaddedProduct = unaddedProduct
        self.addedProduct = addedProduct
        self.loadingProduct = loadingProduct
    }
}
