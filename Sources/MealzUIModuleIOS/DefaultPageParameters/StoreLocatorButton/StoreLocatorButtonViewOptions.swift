//
//  StoreLocatorButtonViewOptions.swift
//
//
//  Created by miam x didi on 29/04/2024.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct StoreLocatorButtonViewOptions {
    public var callToAction: TypeSafeBaseButton
    
    public init(
        callToAction: TypeSafeBaseButton = TypeSafeBaseButton(MealzStoreLocatorButton())
    ) {
        self.callToAction = callToAction
    }
}
