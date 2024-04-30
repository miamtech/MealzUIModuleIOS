//
//  MyBasketViewOptions.swift
//
//
//  Created by Antonin Francois on 27/03/2024.
//

import MealzIOSFramework

/**
 The optional View parameters for MyBasket. If nothing is passed in, the Miam Default will be used
 
 - title:  An implementation of ``BaseTitleProtocol``
 - swapper:  An implementation of ``MyBasketSwapperProtocol``

 */
@available(iOS 14, *)
public struct MyBasketViewOptions {
    public var title: TypeSafeBaseTitle
    public var swapper: TypeSafeMyBasketSwapper
    public var footer: TypeSafeMyBasketFooter

    public init(
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(MealzMyMealsTitle()),
        swapper: TypeSafeMyBasketSwapper = TypeSafeMyBasketSwapper(MealzMyBasketSwapper()),
        footer: TypeSafeMyBasketFooter = TypeSafeMyBasketFooter(MealzMyBasketFooter())
    ) {
        self.title = title
        self.swapper = swapper
        self.footer = footer
    }
}
