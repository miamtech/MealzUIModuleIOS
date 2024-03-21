//
//  FiltersViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MealzIOSFramework

/**
 The optional View parameters for the FiltersView. If nothing is passed in, the Miam Default will be used
 
 - header:  An implementation of ``FiltersHeaderProtocol``
 - section:  An implementation of ``FiltersSectionProtocol``
 - callToAction:  An implementation of ``FiltersCTAProtocol``
 - background: An implementation of ``BackgroundProtocol``
 
 */
@available(iOS 14, *)
public struct FiltersViewOptions {
    public var header: TypeSafeFiltersHeader
    public var callToAction: TypeSafeFiltersCTA
    public var section: TypeSafeFiltersSection
    public var background: TypeSafeBackground
    
    public init(
        header: TypeSafeFiltersHeader = TypeSafeFiltersHeader(MealzFiltersHeader()),
        callToAction: TypeSafeFiltersCTA = TypeSafeFiltersCTA(MealzFiltersCTA()),
        section: TypeSafeFiltersSection = TypeSafeFiltersSection(MealzFiltersSection()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.header = header
        self.callToAction = callToAction
        self.section = section
        self.background = background
    }
}
