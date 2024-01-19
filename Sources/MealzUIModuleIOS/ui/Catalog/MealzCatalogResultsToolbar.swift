//
//  MealzCatalogResultsToolbar.swift
//
//
//  Created by didi on 08/08/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzCatalogResultsToolbar: CatalogToolbarProtocol {
    public init () {}
    public func content(params: CatalogToolbarParameters) -> some View {
        HStack(spacing: Dimension.sharedInstance.xlPadding) {
            CatalogToolbarSearchButton(onSearchTapped: params.onSearchTapped)
            Spacer()
            CatalogToolbarButtonFormat(icon:  Image.mealzIcon(icon: .filters), action: params.onFiltersTapped)
            if params.usesPreferences {
                CatalogToolbarButtonFormat(icon:  Image.mealzIcon(icon: .chefHat), action: params.onPreferencesTapped)
            }
        }
        .padding(Dimension.sharedInstance.mlPadding)
    }
}

@available(iOS 14, *)
struct MealzCatalogResultsToolbar_Previews: PreviewProvider {
    static var previews: some View {
        MealzCatalogToolbar().content(
            params: CatalogToolbarParameters(
            usesPreferences: true,
            onFiltersTapped: {},
            onSearchTapped: {},
            onFavoritesTapped: {},
            onPreferencesTapped: {}))
    }
}
