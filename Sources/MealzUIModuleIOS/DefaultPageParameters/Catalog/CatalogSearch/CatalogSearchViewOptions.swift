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

 
 */
@available(iOS 14, *)
public class CatalogSearchViewOptions {
    public var search: TypeSafeSearch
    
    public init(
        search: TypeSafeSearch = TypeSafeSearch(MealzGeneralSearch())
    ) {
        self.search = search
    }
}
