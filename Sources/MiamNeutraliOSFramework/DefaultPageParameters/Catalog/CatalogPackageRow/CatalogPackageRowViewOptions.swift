//
//  CatalogPackageRowViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the CatalogPackageRow. If nothing is passed in, the Miam Default will be used
 
 - title:  An implementation of ``BaseTitleProtocol``. This will be shown above the content
 - callToAction:  An implementation of ``CatalogPackageCTAProtocol``. This will invite the user to see all the recipes in this collection
 - recipeCard:  An implementation of ``CatalogRecipeCardProtocol``. Each Recipe will appear like this
 - recipeCardLoading:  An implementation of ``RecipeCardLoadingProtocol``. Compoenent when the recipe cards are loading
 
 */
@available(iOS 14, *)
public class CatalogPackageRowViewOptions {
    public var callToAction: TypeSafeCatalogPackageCTA
    public var title: TypeSafeBaseTitle
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        callToAction: TypeSafeCatalogPackageCTA = TypeSafeCatalogPackageCTA(MiamNeutralCatalogPackageCTA()),
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(MiamNeutralCatalogPackageTitle()),
        recipeCard: TypeSafeCatalogRecipeCard = TypeSafeCatalogRecipeCard(MiamNeutralRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MiamNeutralRecipeCardLoading())
    ) {
        self.callToAction = callToAction
        self.title = title
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
    }
}