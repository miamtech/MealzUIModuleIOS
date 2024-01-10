//
//  File.swift
//  
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsProductsView: RecipeDetailsProductsProtocol {
    
    public init() {}
    
    let dimension = Dimension.sharedInstance
    public func content(data: RecipeProductData, actions: RecipeProductActions) -> some View {
        Text("products")
    }
}
