//
//  PriceViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 The optional View parameters for Price. If nothing is passed in, the Miam Default will be used
 
 - priceSuccess:  An implementation of ``PriceSuccessProtocol``
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 
 */
@available(iOS 14, *)
public struct PriceViewOptions {
    public var priceSuccess: TypeSafePriceSuccess
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        pricePerPerson: Bool = true,
        priceSuccess: (TypeSafePriceSuccess)? = nil,
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView()),
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView())
    ) {
        self.priceSuccess = priceSuccess ?? TypeSafePriceSuccess(MealzPriceView(pricePerPerson: pricePerPerson))
        self.empty = empty
        self.loading = loading
    }
}
