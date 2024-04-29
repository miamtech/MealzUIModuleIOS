//
//  StoreLocatorButtonParameters.swift
//
//
//  Created by miam x didi on 29/04/2024.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public class StoreLocatorButtonParameters: StoreLocatorButtonParametersProtocol {
    public var callToAction: TypeSafeBaseButton
    public var actions: StoreLocatorButtonActions
    
    public init(
        viewOptions: StoreLocatorButtonViewOptions = StoreLocatorButtonViewOptions(),
        actions: StoreLocatorButtonActions
    ) {
        self.callToAction = viewOptions.callToAction
        self.actions = actions
    }
}
