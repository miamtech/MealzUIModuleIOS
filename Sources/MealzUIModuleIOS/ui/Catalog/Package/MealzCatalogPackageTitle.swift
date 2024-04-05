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
    public func content(params: TitleParameters) -> some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(params.title)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                    .lineLimit(1)
                if let subtitle = params.subtitle {
                    Text(subtitle)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                        .lineLimit(1)
                }
            }.padding(.horizontal, Dimension.sharedInstance.mPadding)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

@available(iOS 14, *)
struct MealzCatalogPackageTitle_Previews: PreviewProvider {
    static var previews: some View {
        MealzCatalogPackageTitle().content(params: TitleParameters(title: "Test", subtitle: "Subtitle"))
    }
}
