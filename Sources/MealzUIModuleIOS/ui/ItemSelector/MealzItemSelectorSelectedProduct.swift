//
//  MealzItemSelectorSelectedProduct.swift
//  
//
//  Created by Miam on 04/10/2023.
//

import Foundation
import SwiftUI
import MealzIOSFramework
import mealzcore

@available(iOS 14, *)
public struct MealzItemSelectorSelectedProduct: ItemSelectorSelectedProductProtocol{
    
    public init(){}
    
    public func content(params: ItemSelectorSelectedProductParameters) -> some View {
        ItemSelectorProductRow(product: params.product, isSelected: true)
            .onTapGesture {
                params.onSeeItemDetails(params.product.id)
            }
    }
}
