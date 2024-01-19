//
//  CatalogPackageRowParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import SwiftUI
import MiamIOSFramework

/**
 A class implementing the necessary parameters for the Catalog Package Rows, or Catagories.
 
 Mandatory Parameters:
 - onSeeAllRecipes: (String, String) -> Void: A closure to see all the recipes of the collection in the next page. The first String is the catagoryId & the second is the catagoryTitle, both of which will be passed into the CatalogResultsPage
 - onShowRecipeDetails: (String) -> Void: A closure that opens the RecipeDetails, passing in the recipeId
 - onRecipeCallToActionTapped: (String) -> Void: A closure that executes the callback in the recipeCard CTA. This is often a navigation to the Basket, but it can also be used on MealPlanner to navigate back to the MealPlanner Results
 
 Optional Parameters:
 - viewOptions: ``CatalogPackageRowViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class CatalogPackageRowParameters: CatalogPackageRowParametersProtocol {
    public var actions: CatalogPackageRowActions
    
    public var callToAction: TypeSafeCatalogPackageCTA
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        actions: CatalogPackageRowActions,
        viewOptions: CatalogPackageRowViewOptions = CatalogPackageRowViewOptions()
    ) {
        self.actions = actions
        self.callToAction = viewOptions.callToAction
        self.recipeCard = viewOptions.recipeCard
        self.recipeCardLoading = viewOptions.recipeCardLoading
    }
}
