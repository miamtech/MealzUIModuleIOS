//
//  MealzCatalogPackageCTA.swift
//
//
//  Created by didi on 11/08/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzCatalogPackageCTA: CatalogPackageCTAProtocol {
    public init () {}
    public func content(params: CatalogPackageCTAParameters) -> some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(params.title)
                    .foregroundColor(Color.mealzColor(.primaryText))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                    .lineLimit(1)
                if let subtitle = params.subtitle {
                    Text(subtitle)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                        .lineLimit(1)
                }
            }
            Button( action: {
                params.onSeeAllRecipes()
            }, label: {
                HStack {
                    Text(Localization.catalog.showAll.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                        .foregroundColor(Color.mealzColor(.primary))
                    Image.mealzIcon(icon: .arrow)
                        .renderingMode(.template)
                        .foregroundColor(Color.mealzColor(.primary))
                }
            })
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, Dimension.sharedInstance.lPadding)
        .padding(.horizontal, Dimension.sharedInstance.mPadding)
    }
}

@available(iOS 14, *)
struct MealzCatalogPackageCTA_Previews: PreviewProvider {
    static var previews: some View {
        MealzCatalogPackageCTA().content(
            params: CatalogPackageCTAParameters(
            title: "test",
            subtitle: "test 1",
            onSeeAllRecipes: {}
        ))
    }
}
