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
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 - background: An implementation of ``BackgroundProtocol``
 
 */
@available(iOS 14, *)
public struct PreferencesSearchViewOptions {
    public var search: TypeSafeSearch
    public var tagButton: TypeSafeBaseButton
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        search: TypeSafeSearch = TypeSafeSearch(MealzGeneralSearch(hasButton: false)),
        tagButton: TypeSafeBaseButton = TypeSafeBaseButton(MealzPreferencesSearchTag()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView()),
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView()),
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView())
    ) {
        self.search = search
        self.tagButton = tagButton
        self.background = background
        self.empty = empty
        self.loading = loading
    }
}
