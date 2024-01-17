//
//  CatalogSearchParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import SwiftUI
import MiamIOSFramework

/**
 A class implementing the necessary parameters for Catalog Search.

 Mandatory Parameters:
 - onApplied: () -> Void: A closure that updates the Filters Singleton witht he current search & closes the page, this should navigate to the Catalog Results Page
 
 Optional Parameters:
 - viewOptions: ``CatalogSearchViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class CatalogSearchParameters: CatalogSearchParametersProtocol {
    public var onApplied: () -> Void
    public var search: TypeSafeSearch
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    public var background: TypeSafeBackground
    
    public init(
        onApplied: @escaping () -> Void,
        viewOptions: CatalogSearchViewOptions = CatalogSearchViewOptions()
    ) {
        self.onApplied = onApplied
        self.search = viewOptions.search
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
        self.background = viewOptions.background
    }
}
