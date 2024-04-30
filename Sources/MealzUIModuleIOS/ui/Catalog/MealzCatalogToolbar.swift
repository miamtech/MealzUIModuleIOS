//
//  MealzCatalogToolbar.swift
//
//
//  Created by didi on 08/08/2023.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzCatalogToolbar: CatalogToolbarProtocol {
    public init () {}
    public func content(params: CatalogToolbarParameters) -> some View {
        VStack(alignment: .leading, spacing: Dimension.sharedInstance.lPadding) {
            Text(Localization.catalog.title.localised)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
            HStack(spacing: Dimension.sharedInstance.xlPadding) {
                CatalogToolbarSearchButton(onSearchTapped: params.onSearchTapped)
                Spacer()
                CatalogToolbarButtonFormat(icon:  Image.mealzIcon(icon: .filters), action: params.onFiltersTapped)
                if params.usesPreferences {
                    CatalogToolbarButtonFormat(icon:  Image.mealzIcon(icon: .chefHat), action: params.onPreferencesTapped)
                }
                CatalogToolbarButtonFormat(icon:  Image.mealzIcon(icon: .heart), action: params.onFavoritesTapped)
            }
        }
        .padding(Dimension.sharedInstance.mlPadding)
    }
}

@available(iOS 14, *)
struct CatalogToolbarButtonFormat: View {
    let icon: Image
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            icon
                .renderingMode(.template)
                .resizable()
                .frame(width: 25, height: 24)
                .foregroundColor(Color.mealzColor(.primary))
        }
        .frame(width: 30)
    }
}

@available(iOS 14, *)
struct CatalogToolbarSearchButton: View {
    let onSearchTapped: () -> Void
    var body: some View {
        Button {
            onSearchTapped()
        } label: {
            Image.mealzIcon(icon: .search)
                .renderingMode(.template)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
        }
        .padding(Dimension.sharedInstance.mlPadding)
        .background(Color.mealzColor(.primary))
        .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
    }
}
