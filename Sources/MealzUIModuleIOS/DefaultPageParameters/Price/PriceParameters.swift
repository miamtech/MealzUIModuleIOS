//
//  PriceParameters.swift
//  
//
//  Created by didi on 03/10/2023.
//

import MealzIOSFramework

/**
 A class implemening the necessary parameters for Price.
 
 Optional Parameters:
 - viewOptions: ``PriceViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public struct PriceParameters: PriceParametersProtocol {
    public var priceSuccess: TypeSafePriceSuccess
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        viewOptions: PriceViewOptions = PriceViewOptions()
    ) {
        self.priceSuccess = viewOptions.priceSuccess
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
    }
}
