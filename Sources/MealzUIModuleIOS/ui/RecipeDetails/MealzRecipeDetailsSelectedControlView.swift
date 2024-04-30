//
//  MealzRecipeDetailsSelectedControlView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//


import SwiftUI
import MealzIOSFramework
import mealzcore

@available(iOS 14, *)
public struct MealzRecipeDetailsSelectedControlView: RecipeDetailsSelectedControlProtocol {
    public init() {}
    public func content(params: RecipeDetailsSelectedControlParameters) -> some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.mealzColor(.lightBackground))
                Rectangle()
                    .fill(Color.mealzColor(.primary))
                    .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
                    .padding(2)
                    .frame(width: geometry.size.width / 2, height: 50)
                    .offset(x: params.selection == .shopping ? geometry.size.width * -0.25 : geometry.size.width  * 0.25, y: 0)
                    .animation(.interactiveSpring(), value: params.selection)
                    .frame(maxWidth: .infinity)
                HStack(spacing: 0) {
                    TabView(
                        title: Localization.recipeDetails.shopping.localised,
                        currentTab: params.selection,
                        tabActive: params.selection == .shopping) {
                            params.selection = .shopping
                        }
                        .frame(width: geometry.size.width / 2)
                    TabView(
                        title: Localization.recipeDetails.cooking.localised,
                        currentTab: params.selection,
                        tabActive: params.selection == .cooking) {
                            params.selection = .cooking
                        }
                        .frame(width: geometry.size.width / 2)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 50)
        .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
        .padding(Dimension.sharedInstance.lPadding)
    }
    
    private struct TabView: View {
        let title: String
        let currentTab: SelectedControlPage
        let tabActive: Bool
        let changeTab: () -> Void
        var body: some View {
            Button(action: {
                withAnimation { changeTab() }
            }, label: {
                Text(title).lineLimit(1)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(tabActive ?
                                     Color.mealzColor(.standardLightText) : Color.mealzColor(.standardDarkText))
            })
        }
    }
}
