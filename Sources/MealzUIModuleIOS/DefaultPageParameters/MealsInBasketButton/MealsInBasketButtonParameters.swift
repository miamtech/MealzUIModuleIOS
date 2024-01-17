//
//  MealsInBasketButtonParameters.swift
//  
//
//  Created by didi on 03/10/2023.
//

import MiamIOSFramework

/**
 A class implemening the necessary parameters for the MealsInBasket Button.
 
 Optional Parameters:
 - success:  An implementation of ``MealsInBasketButtonSuccessProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 
 */
@available(iOS 14, *)
public class MealsInBasketButtonParameters: MealsInBasketButtonParametersProtocol {
    public var success: TypeSafeMealsInBasketButtonSuccess
    public var empty: TypeSafeEmpty
    
    public init(
        success: TypeSafeMealsInBasketButtonSuccess = TypeSafeMealsInBasketButtonSuccess(MealzMealsInBasketButtonSuccess()),
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView())
    ) {
        self.success = success
        self.empty = empty
    }
}
