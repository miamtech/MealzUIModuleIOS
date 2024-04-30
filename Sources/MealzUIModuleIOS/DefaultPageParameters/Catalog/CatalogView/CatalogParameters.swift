//
//  CatalogParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import SwiftUI
import MealzIOSFramework
import mealzcore

/**
 A class implemening the necessary parameters for the Catalog Page.
 
 Mandatory Parameters:
 - onFiltersTapped: (SingletonFilterViewModel) -> Void: A closure that navigates to the FiltersPage when the user taps on Filter Button.
 - onSearchTapped: () -> Void: A closure that navigates to the SearchPage when the user taps on Search Button.
 - onFavoritesTapped: () -> Void: A closure that navigates to the CatalogResultsPage when the user taps on Favorites Button.
 - onPreferencesTapped: () -> Void: A closure that navigates to the PreferencesPage when the user taps on Preferences Button.
 - onLaunchMealPlanner: (() -> Void)?: An optional closure that navigates to the MealPlanner when the user taps on MealPlanner Button.
 - onMealsInBasketButtonTapped: () -> Void: A closure that navigates to the MyMeals Page when the user taps on MyMeals Button.
 
 Optional Parameters:
 - viewOptions: ``CatalogViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public struct CatalogParameters: CatalogParametersProtocol {
    
    public var actions: CatalogActions
    public var catalogToolbar: TypeSafeCatalogToolbar
    public var resultsToolbar: TypeSafeCatalogToolbar
    
    public var mealPlannerCTA: TypeSafeMealPlannerCTA
    public var mealsInBasketButton: MealsInBasketButtonParameters
    
    public init(
        actions: CatalogActions,
        viewOptions: CatalogViewOptions = CatalogViewOptions()
    ) {
        self.actions = actions
        
        self.catalogToolbar = viewOptions.catalogToolbar
        self.resultsToolbar = viewOptions.resultsToolbar
        self.mealPlannerCTA = viewOptions.mealPlannerCTA
        self.mealsInBasketButton = viewOptions.mealsInBasketButton
    }
}
