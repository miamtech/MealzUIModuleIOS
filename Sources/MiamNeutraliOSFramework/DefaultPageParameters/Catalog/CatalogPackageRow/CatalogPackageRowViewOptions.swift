//
//  CatalogPackageRowViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the CatalogPackageRow. If nothing is passed in, the Miam Default will be used
 
 - callToAction:  An implementation of ``CatalogPackageCTAProtocol``. This will invite the user to see all the recipes in this collection
 - recipeCard:  An implementation of ``CatalogRecipeCardProtocol``. Each Recipe will appear like this
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``. Compoenent when the recipe cards are loading
 
 */
@available(iOS 14, *)
public class CatalogPackageRowViewOptions {
    public var callToAction: TypeSafeCatalogPackageCTA
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        callToAction: TypeSafeCatalogPackageCTA = TypeSafeCatalogPackageCTA(MiamNeutralCatalogPackageCTA()),
        recipeCard: TypeSafeCatalogRecipeCard = TypeSafeCatalogRecipeCard(MealzRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MiamNeutralRecipeCardLoading())
    ) {
        self.callToAction = callToAction
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
    }
}
