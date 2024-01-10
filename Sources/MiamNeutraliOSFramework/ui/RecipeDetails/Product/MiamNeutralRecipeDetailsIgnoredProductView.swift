//
//  MiamNeutralRecipeDetailsIgnoredProductView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsIgnoredProductView: RecipeDetailsIgnoredProductsProtocol {
    
    public init() {}
    public func content(ingredientName: String, ingredientQuantity: String?, ingredientUnit: String?, addToBasket: @escaping () -> Void) -> some View {
        ZStack {
            Color.red
            VStack {
                Button(action: addToBasket, label: {Text("Add me")})
            }
        }
    }
}
