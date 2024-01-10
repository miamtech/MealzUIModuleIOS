//
//  MiamNeutralRecipeDetailsAddedProductView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsAddedProductView: RecipeDetailsAddedProductsProtocol {
    public init() {}
    public func content(data: RecipeProductData, onDeleteProduct: @escaping () -> Void, onChangeProduct: @escaping () -> Void, updateProductQuantity: @escaping (Int) -> Void) -> some View {
        ZStack {
            Color.green
            VStack {
                Button(action: onDeleteProduct, label: {Text("delete me")})
                Button(action: onChangeProduct, label: {Text("change me")})
            }
        }
    }
}
