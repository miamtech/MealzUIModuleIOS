//
//  PreferencesSearchParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import MiamIOSFramework

/**
 A class implemening the necessary parameters for the PreferencesSearch Page.
 
 Mandatory Parameters:
 - onClosed: () -> Void: A closure that applies the item & closes the page
 
 Optional Parameters:
 - viewOptions: ``PreferencesSearchViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class PreferencesSearchParameters: PreferencesSearchProtocol {
    public var actions: PreferencesSearchActions
    public var search: TypeSafeSearch
    public var tagButton: TypeSafeBaseButton
    
    public init(
        actions: PreferencesSearchActions,
        viewOptions: PreferencesSearchViewOptions = PreferencesSearchViewOptions()
    ) {
        self.actions = actions
        self.search = viewOptions.search
        self.tagButton = viewOptions.tagButton
    }
}
