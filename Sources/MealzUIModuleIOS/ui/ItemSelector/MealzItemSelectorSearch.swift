//
//  MealzItemSelectorSearch.swift
//
//
//  Created by Damien Walerowicz on 11/01/2024.
//

import Foundation
import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzItemSelectorSearch: SearchProtocol {
    
    public init() { }
    public func content(params: SearchParameters) -> some View {
        HStack(alignment: .center, spacing: 8) {
            Image.mealzIcon(icon: .search)
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(Color.mealzColor(.grayText))
            TextField(Localization.itemSelector.search.localised, text: params.searchText)
                .foregroundColor(params.searchText.wrappedValue.isEmpty ? Color.mealzColor(.standardDarkText) : Color.mealzColor(.grayText))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .onChange(of: params.searchText.wrappedValue, perform: { value in
                    params.onApply()
                })
        }
        .padding(Dimension.sharedInstance.mPadding)
        .overlay(RoundedRectangle(cornerRadius: Dimension.sharedInstance.mCornerRadius)
            .stroke(Color.mealzColor(.border), lineWidth: 1.0))
        .padding(Dimension.sharedInstance.mPadding)
    }
}
