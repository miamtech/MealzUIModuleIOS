//
//  MiamNeutralRecipeDetailsUnaddedProductView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsUnaddedProductView: RecipeDetailsUnaddedProductsProtocol {
    public init() {}
    public func content(data: RecipeProductData, onAddProduct: @escaping () -> Void, onIgnoreProduct: @escaping () -> Void, onChooseProduct: @escaping () -> Void) -> some View {
        ZStack {
            Color.yellow
            VStack {
                Button(action: onAddProduct, label: {Text("Add me")})
                Button(action: onIgnoreProduct, label: {Text("ignore me")})
                Button(action: onChooseProduct, label: {Text("choose me")})
            }
        }
    }
}
