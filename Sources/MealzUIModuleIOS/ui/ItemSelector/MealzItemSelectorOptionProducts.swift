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

    public func content(params: ItemSelectorOptionProductsParameters) -> some View {
        ForEach(params.products, id: \.self) { product in
            HStack {
                ItemSelectorProductRow(
                    product: product,
                    onSelectProduct: params.onItemSelected
                )
            }.onTapGesture {
                params.onSeeItemDetails(product.id)
            }
        }
    }
}
