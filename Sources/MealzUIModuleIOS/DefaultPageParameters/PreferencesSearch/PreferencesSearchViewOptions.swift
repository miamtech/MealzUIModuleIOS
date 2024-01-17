//
//  PreferencesSearchViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 The optional View parameters for PreferencesSearch. If nothing is passed in, the Miam Default will be used
 
 - search:  An implementation of ``SearchProtocol``
 - tagButton:  An implementation of ``BaseButtonProtocol``

 
 */
@available(iOS 14, *)
public struct PreferencesSearchViewOptions {
    public var search: TypeSafeSearch
    public var tagButton: TypeSafeBaseButton
    
    public init(
        search: TypeSafeSearch = TypeSafeSearch(MealzGeneralSearch(hasButton: false)),
        tagButton: TypeSafeBaseButton = TypeSafeBaseButton(MealzPreferencesSearchTag())
    ) {
        self.search = search
        self.tagButton = tagButton
    }
}
