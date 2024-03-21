//
//  MyMealsParameters.swift
//  
//
//  Created by didi on 11/10/2023.
//

import MealzIOSFramework

/**
 A class implemening the necessary parameters for the MyMeals Page.
 
 Mandatory Parameters:
 - onNoResultsRedirect: () -> Void: A closure that navigates the user to a different page when the user doesn't have any recipes in their basket. This should usually navigate to the CatalogView
 - onShowRecipeDetails: (String) -> Void: A closure that opens the RecipeDetails, passing in the recipeId
 
 Optional Parameters:
 - viewOptions: ``MyMealsViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class MyMealsParameters: MyMealsParametersProtocol {
    public var actions: MyMealsActions
  
    public var title: TypeSafeBaseTitle
    public var recipeCard: TypeSafeMyMealRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    
    public init(
        actions: MyMealsActions,
        viewOptions: MyMealsViewOptions = MyMealsViewOptions()
    ) {
        self.actions = actions
        self.recipeCard = viewOptions.recipeCard
        self.recipeCardLoading = viewOptions.recipeCardLoading
        self.title = viewOptions.title
    }
}
