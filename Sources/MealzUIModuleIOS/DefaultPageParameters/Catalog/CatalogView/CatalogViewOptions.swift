//
//  CatalogViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the Catalog. If nothing is passed in, the Miam Default will be used
 
 - useMealPlanner: Bool = false -> if you plan on using the mealPlanner, this MUST be set to true. The default is false
 - catalogToolbar:  An implementation of ``CatalogToolbarProtocol``. This will be shown on the main CatalogPage. With default Miam implementation, it will contain the Favorites button
 - resultsToolbar:  An implementation of ``CatalogToolbarProtocol``. This will be shown on the Results Page (after pressing favorites, filtering, or seaching).
 /// With default Miam implementation, it will NOT contain the Favorites button
 - mealPlannerCTA:  An implementation of ``MealPlannerCTAProtocol``. This will be shown on the main CatalogPage if launchMealPlanner function has content.
 - mealsInBasketButton:  An implementation of ``MealsInBasketButtonParametersProtocol``. Parameters for MyMealsButton. The passed in parameters should also define where in the view the button is. For example, if you want the button at the bottom, it should have a .frame(alignment: .bottom)
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 - background: An implementation of ``BackgroundProtocol``

 */
@available(iOS 14, *)
public struct CatalogViewOptions {
    public var catalogToolbar: TypeSafeCatalogToolbar
    public var resultsToolbar: TypeSafeCatalogToolbar
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    public var mealPlannerCTA: TypeSafeMealPlannerCTA
    public var mealsInBasketButton: MealsInBasketButtonParameters
    
    public init(
        useMealPlanner: Bool = false,
        catalogToolbar: TypeSafeCatalogToolbar = TypeSafeCatalogToolbar(MealzCatalogToolbar()),
        resultsToolbar: TypeSafeCatalogToolbar = TypeSafeCatalogToolbar(MealzCatalogResultsToolbar()),
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView()),
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView()),
        mealPlannerCTA: TypeSafeMealPlannerCTA? = nil,
        mealsInBasketButtonSuccess: TypeSafeMealsInBasketButtonSuccess = TypeSafeMealsInBasketButtonSuccess(MealzMealsInBasketButtonSuccess()),
        mealsInBasketButtonEmpty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView())
    ) {
        self.background = background
        self.empty = empty
        self.loading = loading
        self.catalogToolbar = catalogToolbar
        self.resultsToolbar = resultsToolbar
        self.mealsInBasketButton = MealsInBasketButtonParameters(
            success: mealsInBasketButtonSuccess,
            empty: mealsInBasketButtonEmpty
        )
        if useMealPlanner {
            if let mealPlannerCTA {
                self.mealPlannerCTA = mealPlannerCTA
            } else {
                self.mealPlannerCTA = TypeSafeMealPlannerCTA( MealzMealPlannerCallToAction())
            }
        } else {
            self.mealPlannerCTA = TypeSafeMealPlannerCTA( DefaultMealPlannerCTA())
        }
    }
}
