//
//  MealzCatalogRecipesListTitle.swift
//
//
//  Created by didi on 10/08/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzCatalogPackageTitle: BaseTitleProtocol {
    public init() {}
    public func content(title: String, subtitle: String?) -> some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(title)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                    .lineLimit(1)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                        .lineLimit(1)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

@available(iOS 14, *)
struct MealzCatalogPackageTitle_Previews: PreviewProvider {
    static var previews: some View {
        MealzCatalogPackageTitle().content(title: "Test", subtitle: "Subtitle")
    }
}
