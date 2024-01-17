//
//  CatalogParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

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
    
    public var onFiltersTapped: (FilterInstance) -> Void
    public var onSearchTapped: (FilterInstance) -> Void
    public var onFavoritesTapped: () -> Void
    public var onPreferencesTapped: () -> Void
    public var onLaunchMealPlanner: (() -> Void)?
    public var onMealsInBasketButtonTapped: () -> Void
    public var catalogToolbar: TypeSafeCatalogToolbar
    public var resultsToolbar: TypeSafeCatalogToolbar
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    public var mealPlannerCTA: TypeSafeMealPlannerCTA
    public var mealsInBasketButton: MealsInBasketButtonParameters
    
    public init(
        onFiltersTapped: @escaping (FilterInstance) -> Void,
        onSearchTapped: @escaping (FilterInstance) -> Void,
        onFavoritesTapped: @escaping () -> Void,
        onPreferencesTapped: @escaping () -> Void,
        onLaunchMealPlanner: (() -> Void)? = nil,
        onMealsInBasketButtonTapped: @escaping () -> Void,
        viewOptions: CatalogViewOptions = CatalogViewOptions()
    ) {
        self.onFiltersTapped = onFiltersTapped
        self.onSearchTapped = onSearchTapped
        self.onFavoritesTapped = onFavoritesTapped
        self.onPreferencesTapped = onPreferencesTapped
        self.onLaunchMealPlanner = onLaunchMealPlanner
        self.onMealsInBasketButtonTapped = onMealsInBasketButtonTapped
        self.background = viewOptions.background
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
        self.catalogToolbar = viewOptions.catalogToolbar
        self.resultsToolbar = viewOptions.resultsToolbar
        self.mealPlannerCTA = viewOptions.mealPlannerCTA
        self.mealsInBasketButton = viewOptions.mealsInBasketButton
    }
}
