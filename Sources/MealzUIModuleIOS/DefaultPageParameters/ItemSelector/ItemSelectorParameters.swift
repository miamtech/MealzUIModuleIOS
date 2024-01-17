//
//  ItemSelectorParameters.swift
//  
//
//  Created by Miam on 04/10/2023.
//

import MiamIOSFramework

/**
 A class implemening the necessary parameters for the ItemSelector Page.
 
 Mandatory Parameters:
 - onItemSelected: () -> Void: A closure to call once item has been selected (it should a naviagtion function)
 
 Optional Parameters:
 - viewOptions: ``ItemSelectorViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
/// This sets the Templates for the ItemSelector
public struct ItemSelectorParameters: ItemSelectorParametersProtocol {
    public var searchBar: TypeSafeSearch
    public var title: TypeSafeBaseTitle
    public var selectedProduct: TypeSafeItemSelectorSelectedProduct
    public var productOptions: TypeSafeItemSelectorOptionProducts
    public var noResults: TypeSafeItemSelectorNoResults
    
    public var onItemSelected: () -> Void
    
    public init(
        onItemSelected: @escaping () -> Void,
        viewOptions : ItemSelectorViewOptions = ItemSelectorViewOptions()
    ){
        self.searchBar = viewOptions.searchBar
        self.title = viewOptions.title
        self.selectedProduct = viewOptions.selectedProduct
        self.productOptions = viewOptions.productOptions
        self.noResults = viewOptions.noResults
        
        self.onItemSelected = onItemSelected
    }
}
