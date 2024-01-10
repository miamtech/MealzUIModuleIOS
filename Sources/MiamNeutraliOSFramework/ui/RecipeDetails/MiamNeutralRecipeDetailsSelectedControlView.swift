//
//  MiamNeutralRecipeDetailsSelectedControlView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//


import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsSelectedControlView:
    RecipeDetailsSelectedControlProtocol {
    
    
    
    var titles: [String] = [Localization.recipeDetails.shopping.localised, Localization.recipeDetails.cooking.localised]
    @SwiftUI.State private var frames = Array<CGRect>(repeating: .zero, count: 4)
    
    public init() {}
    
    public func content(selection: Binding<Int>) -> some View {
        HStack(spacing: 0) {
            ForEach(titles.indices, id:\.self) { index in
                ZStack {
                    Rectangle()
                        .fill(Color.mealzColor(.lightBackground))
                    Rectangle()
                        .fill(Color.mealzColor(.primary))
                        .cornerRadius(25)
                        .padding(2)
                        .opacity(selection.wrappedValue == index ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(.interactiveSpring()) {
                                selection.wrappedValue = index
                            }
                        }
                }
                .overlay(
                    Text(titles[index]).lineLimit(1)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                        .foregroundColor((selection.wrappedValue == index) ? .white : .black)
                    
                )
            }
        }
        .frame(height: 50)
        .cornerRadius(25)
    }
}
