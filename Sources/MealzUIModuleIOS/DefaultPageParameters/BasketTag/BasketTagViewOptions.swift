//
//  BasketTagViewOptions.swift
//  
//
//  Created by didi on 16/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the Basket Tag. If nothing is passed in, the Miam Default will be used
 
 - title: An implementation of ``BaseTitleProtocol`` that is each Basket Tag button,
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 - background: An implementation of ``BackgroundProtocol``

 */
@available(iOS 14, *)
public struct BasketTagViewOptions {
    
    public var title: TypeSafeBaseTitle
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        title: TypeSafeBaseTitle =
        TypeSafeBaseTitle(MealzBasketTagItem()),
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView()),
        loading: TypeSafeLoading = TypeSafeLoading(MealzBasketTagItemLoading()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.title = title
        self.background = background
        self.empty = empty
        self.loading = loading
    }
}
