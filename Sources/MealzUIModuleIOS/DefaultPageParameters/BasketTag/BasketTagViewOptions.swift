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

 */
@available(iOS 14, *)
public struct BasketTagViewOptions {
    
    public var title: TypeSafeBaseTitle
    
    public init(
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(MealzBasketTagItem())
    ) {
        self.title = title
    }
}
