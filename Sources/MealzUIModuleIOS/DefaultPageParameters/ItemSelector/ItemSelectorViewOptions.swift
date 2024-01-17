//
//  ItemSelectorViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MiamIOSFramework

/**
 The optional View parameters for ItemSelector. If nothing is passed in, the Miam Default will be used
 
 - selectedProduct:  An implementation of ``ItemSelectorSelectedProductProtocol``
 - productOptions:  An implementation of ``ItemSelectorOptionProductsProtocol``

 
 */
@available(iOS 14, *)
public struct ItemSelectorViewOptions {
    public var searchBar: TypeSafeSearch
    public var title: TypeSafeBaseTitle
    public var selectedProduct: TypeSafeItemSelectorSelectedProduct
    public var productOptions: TypeSafeItemSelectorOptionProducts
    public var noResults: TypeSafeItemSelectorNoResults
    
    
    public init(
        searchBar: TypeSafeSearch = TypeSafeSearch(MealzItemSelectorSearch()),
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(MealzItemSelectorTitle()),
        selectedProduct: TypeSafeItemSelectorSelectedProduct = TypeSafeItemSelectorSelectedProduct(MealzItemSelectorSelectedProduct()),
        productOptions: TypeSafeItemSelectorOptionProducts =
            TypeSafeItemSelectorOptionProducts(MealzItemSelectorOptionProducts()),
        noResults: TypeSafeItemSelectorNoResults = TypeSafeItemSelectorNoResults(MealzItemSelectorNoResultsView())
    ) {
        self.searchBar = searchBar
        self.title = title
        self.selectedProduct = selectedProduct
        self.productOptions = productOptions
        self.noResults = noResults
    }
}
