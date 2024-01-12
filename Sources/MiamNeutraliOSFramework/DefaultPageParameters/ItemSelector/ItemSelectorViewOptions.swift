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
 - loading:  An implementation of ``LoadingProtocol``
 - empty:  An implementation of ``EmptyProtocol``
 - background: An implementation of ``BackgroundProtocol``
 
 */
@available(iOS 14, *)
public struct ItemSelectorViewOptions {
    public var searchBar: TypeSafeSearch
    public var title: TypeSafeBaseTitle
    public var selectedProduct: TypeSafeItemSelectorSelectedProduct
    public var productOptions: TypeSafeItemSelectorOptionProducts
    public var noResults: TypeSafeItemSelectorNoResults
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        searchBar: TypeSafeSearch = TypeSafeSearch(MiamNeutralItemSelectorSearch()),
        title: TypeSafeBaseTitle = TypeSafeBaseTitle(MealzItemSelectorTitle()),
        selectedProduct: TypeSafeItemSelectorSelectedProduct = TypeSafeItemSelectorSelectedProduct(MiamNeutralItemSelectorSelectedProduct()),
        productOptions: TypeSafeItemSelectorOptionProducts =
            TypeSafeItemSelectorOptionProducts(MiamNeutralItemSelectorOptionProducts()),
        noResults: TypeSafeItemSelectorNoResults = TypeSafeItemSelectorNoResults(MiamNeutralItemSelectorNoResultsView()),
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView()),
        loading: TypeSafeLoading = TypeSafeLoading(MiamNeutralGeneralLoading()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.searchBar = searchBar
        self.title = title
        self.selectedProduct = selectedProduct
        self.productOptions = productOptions
        self.noResults = noResults
        self.background = background
        self.empty = empty
        self.loading = loading
    }
}
