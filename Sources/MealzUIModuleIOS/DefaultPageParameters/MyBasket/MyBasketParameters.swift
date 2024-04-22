//
//  MyBasketParameters.swift
//
//
//  Created by Antonin Francois on 27/03/2024.
//

import MealzIOSFramework

/**
 A class implemening the necessary parameters for the MyBasket Page.
 
 Optional Parameters:
 - viewOptions: ``MyBasketViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class MyBasketParameters: MyBasketParametersProtocol {
    public var title: TypeSafeBaseTitle
    public var swapper: TypeSafeMyBasketSwapper
    public var footer: TypeSafeMyBasketFooter
    
    public var actions: MyBasketActions

    public init(
        actions: MyBasketActions,
        viewOptions: MyBasketViewOptions = MyBasketViewOptions()
    ) {
        self.actions = actions
        
        self.title = viewOptions.title
        self.swapper = viewOptions.swapper
        self.footer = viewOptions.footer
    }
}
