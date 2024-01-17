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
    public func content(
        usesPreferences: Bool,
        onFiltersTapped: @escaping () -> Void,
        onSearchTapped: @escaping () -> Void,
        onFavoritesTapped: @escaping () -> Void,
        onPreferencesTapped: @escaping () -> Void
    ) -> some View {
        HStack(spacing: Dimension.sharedInstance.xlPadding) {
            CatalogToolbarSearchButton(onSearchTapped: onSearchTapped)
            Spacer()
            CatalogToolbarButtonFormat(icon:  Image.mealzIcon(icon: .filters), action: onFiltersTapped)
            if usesPreferences {
                CatalogToolbarButtonFormat(icon:  Image.mealzIcon(icon: .chefHat), action: onPreferencesTapped)
            }
        }
        .padding(Dimension.sharedInstance.mlPadding)
    }
}

@available(iOS 14, *)
struct MealzCatalogResultsToolbar_Previews: PreviewProvider {
    static var previews: some View {
        MealzCatalogToolbar().content(
            usesPreferences: true,
            onFiltersTapped: {},
            onSearchTapped: {},
            onFavoritesTapped: {},
            onPreferencesTapped: {})
    }
}

