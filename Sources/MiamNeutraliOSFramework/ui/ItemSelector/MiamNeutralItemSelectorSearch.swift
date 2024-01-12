//
//  MiamNeutralItemSelectorSearch.swift
//
//
//  Created by Damien Walerowicz on 11/01/2024.
//

import Foundation
import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralItemSelectorSearch: SearchProtocol {
    
    public init() { }
    
    public func content(
        searchText: Binding<String>,
        onApply: @escaping () -> Void
    ) -> some View {
        HStack(alignment: .center, spacing: 8) {
            Image.mealzIcon(icon: .search)
                .frame(width: 24, height: 24)
            TextField(Localization.itemSelector.search.localised, text: searchText)
                .foregroundColor(Color.mealzColor(.darkGray))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .onChange(of: searchText.wrappedValue, perform: { value in
                    onApply()
                })
        }
        .padding(Dimension.sharedInstance.mPadding)
    }
}
