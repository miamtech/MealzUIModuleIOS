//
//  MealzMyBasketSwapper.swift
//
//
//  Created by Antonin Francois on 27/03/2024.
//

import SwiftUI
import MealzIOSFramework
import mealzcore

@available(iOS 14, *)
public struct MealzMyBasketSwapper: MyBasketSwapperProtocol {
    public init() {}
    public func content(params: MyBasketSwapperParameters) -> some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.mealzColor(.lightBackground))
                    .cornerRadius(4)
                Rectangle()
                    .fill(Color.mealzColor(.white))
                    .cornerRadius(4)
                    .padding(.vertical, 4)
                    .padding(.trailing, params.selection == .products ? 4 : 0)
                    .padding(.leading, params.selection == .recipes ? 4 : 0)
                    .frame(width: geometry.size.width / 2, height: 40)
                    .offset(x: params.selection == .recipes ? geometry.size.width * -0.25 : geometry.size.width  * 0.25, y: 0)
                    .animation(.interactiveSpring(), value: params.selection)
                    .shadow(color: Color.mealzColor(.lighterGray), radius: 2)
                    .frame(maxWidth: .infinity)
                HStack(spacing: 0) {
                    TabView(
                        title: Localization.myBasket.recipes.localised,
                        currentTab: params.selection,
                        tabActive: params.selection == .recipes) {
                            params.selection = .recipes
                        }
                        .frame(width: geometry.size.width / 2)
                    TabView(
                        title: Localization.myBasket.products.localised,
                        currentTab: params.selection,
                        tabActive: params.selection == .products) {
                            params.selection = .products
                        }
                        .frame(width: geometry.size.width / 2)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 40)
        .cornerRadius(4)
        .padding(.horizontal, 16)
    }
    
    private struct TabView: View {
        let title: String
        let currentTab: SelectedMyBasketPage
        let tabActive: Bool
        let changeTab: () -> Void
        var body: some View {
            Button(action: {
                withAnimation { changeTab() }
            }, label: {
                Text(title).lineLimit(1)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(tabActive ? Color.mealzColor(.primary) : Color.mealzColor(.grayText))
            })
        }
    }
}
