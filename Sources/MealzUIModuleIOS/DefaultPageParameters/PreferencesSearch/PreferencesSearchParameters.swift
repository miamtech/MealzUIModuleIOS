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
    public var onClosed: () -> Void
    public var search: TypeSafeSearch
    public var tagButton: TypeSafeBaseButton
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    public init(
        onClosed: @escaping () -> Void,
        viewOptions: PreferencesSearchViewOptions = PreferencesSearchViewOptions()
    ) {
        self.onClosed = onClosed
        self.search = viewOptions.search
        self.tagButton = viewOptions.tagButton
        self.background = viewOptions.background
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
    }
}
