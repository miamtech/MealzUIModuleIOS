//
//  MealzItemSelectorOptionProducts.swift
//  
//
//  Created by Miam on 04/10/2023.
//

import Foundation
import MiamIOSFramework
import miamCore
import SwiftUI

@available(iOS 14, *)
public struct MealzItemSelectorOptionProducts: ItemSelectorOptionProductsProtocol{
    
    public init() {}

    public func content(
        products: [Item],
        onItemSelected: @escaping (Item) -> Void
    ) -> some View {
        ForEach(products, id: \.self) { product in
            HStack {
                ItemSelectorProductRow(
                    product: product
                )
            }.onTapGesture {
                onItemSelected(product)
            }
        }
    }
}
