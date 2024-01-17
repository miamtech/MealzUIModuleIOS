//
//  CatalogSearchViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 An object containing all the views for the CatalogSearch. If nothing is passed in, the Miam Default will be used
 
 - search:  An implementation of ``SearchProtocol``
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 - background: An implementation of ``BackgroundProtocol``
 
 */
@available(iOS 14, *)
public class CatalogSearchViewOptions {
    public var search: TypeSafeSearch
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    public var background: TypeSafeBackground
    
    public init(
        search: TypeSafeSearch = TypeSafeSearch(MealzGeneralSearch()),
        empty: TypeSafeEmpty = TypeSafeEmpty(MealzMyMealsEmpty()),
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.search = search
        self.empty = empty
        self.loading = loading
        self.background = background
    }
}
