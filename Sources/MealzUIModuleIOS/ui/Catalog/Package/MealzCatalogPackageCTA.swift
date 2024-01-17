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
    public func content(
        title: String,
        subtitle: String?,
        onSeeAllRecipes: @escaping () -> Void
    ) -> some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Color.mealzColor(.primaryText))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                    .lineLimit(1)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                        .lineLimit(1)
                }
            }
            Button( action: {
                onSeeAllRecipes()
            }, label: {
                HStack {
                    Text(Localization.catalog.showAll.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                        .foregroundColor(Color.mealzColor(.primary))
                    Image.miamImage(icon: .rightArrow)
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
            title: "test",
            subtitle: "test 1",
            onSeeAllRecipes: {}
        )
    }
}
