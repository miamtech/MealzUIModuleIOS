//
//  MyProductsViewOptions.swift
//
//
//  Created by Antonin Francois on 11/04/2024.
//

import MealzIOSFramework

/**
 The optional View parameters for MyProducts. If nothing is passed in, the Mealz Default will be used
 
 - productCard:  An implementation of ``MyProductsProductCardProtocol``

 */
@available(iOS 14, *)
public struct MyProductsViewOptions {
    public var productCard: TypeSafeMyProductsProductCard
    
    public init(
        productCard: TypeSafeMyProductsProductCard = TypeSafeMyProductsProductCard(MealzMyProductsProductCard())
    ) {
        self.productCard = productCard
    }
}
