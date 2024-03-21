//
//  FiltersParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import SwiftUI
import MealzIOSFramework

/**
 An implementation of ``FiltersParametersProtocol``
 
 Mandatory Parameters:
 - onApplied: () -> Void: A closure that updates the Filters Singleton & closes the page.
 - onClosed: () -> Void: A closure that is triggered when the filters page is closed.
 
 Optional Parameters:
 - viewOptions: an implementation of ``FiltersViewOptions``
 
 */
@available(iOS 14, *)
public class FiltersParameters: FiltersParametersProtocol {
    public var actions: FiltersActions
    public var header: TypeSafeFiltersHeader
    public var callToAction: TypeSafeFiltersCTA
    public var section: TypeSafeFiltersSection
    public var background: TypeSafeBackground
        
    public init(
        actions: FiltersActions,
        viewOptions: FiltersViewOptions = FiltersViewOptions()
    ) {
        self.actions = actions
        self.header = viewOptions.header
        self.callToAction = viewOptions.callToAction
        self.section = viewOptions.section
        self.background = viewOptions.background
    }
}
