//
//  MealzItemSelectorSelectedProduct.swift
//  
//
//  Created by Miam on 04/10/2023.
//

import Foundation
import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzItemSelectorSelectedProduct: ItemSelectorSelectedProductProtocol{
    
    public init(){}
    
    public func content(product: Item) -> some View {
        ItemSelectorProductRow(product:product,isSelected:true)
    }
}
