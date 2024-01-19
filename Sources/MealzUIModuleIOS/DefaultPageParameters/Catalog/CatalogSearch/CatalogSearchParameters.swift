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
    public var actions: CatalogSearchActions
    public var search: TypeSafeSearch
    
    public init(
        actions: CatalogSearchActions,
        viewOptions: CatalogSearchViewOptions = CatalogSearchViewOptions()
    ) {
        self.actions = actions
        self.search = viewOptions.search
    }
}
