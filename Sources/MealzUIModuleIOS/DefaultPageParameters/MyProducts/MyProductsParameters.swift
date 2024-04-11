//
//  MyProductsParameters.swift
//
//
//  Created by Antonin Francois on 11/04/2024.
//

import MealzIOSFramework

/**
 A class implemening the necessary parameters for the MyProducts Page.
 
 Mandatory Parameters:
 - onNoResultsRedirect: () -> Void: A closure that navigates the user to a different page when the user doesn't have any products in their basket. This should usually navigate to the CatalogView
 
 Optional Parameters:
 - viewOptions: ``MyProductsViewOptions`` -> An optional object where you can override the default Mealz views for the component.
 
 */
@available(iOS 14, *)
public class MyProductsParameters: MyProductsParametersProtocol {
    public var productCard: TypeSafeMyProductsProductCard
    public var onNoResultsRedirect: () -> Void
    
    public init(
        viewOptions: MyProductsViewOptions = MyProductsViewOptions(),
        onNoResultsRedirect: @escaping () -> Void
    ) {
        self.productCard = viewOptions.productCard
        self.onNoResultsRedirect = onNoResultsRedirect
    }
}
