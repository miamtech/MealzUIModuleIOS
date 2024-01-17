//
//  MealzCatalogRecipesListNoResults.swift
//
//
//  Created by didi on 10/08/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzCatalogRecipesListNoResults: CatalogRecipesListNoResultsProtocol {
    public init() {}
    public func content(
        catalogContent: CatalogContent,
        searchText: String,
        onNoResultsRedirect: @escaping () -> Void
    ) -> some View {
        VStack(spacing: 32.0) {
            Image.mealzIcon(icon: .feelingBlue)
            if catalogContent == CatalogContent.favorite {
                Text(Localization.catalog.preferencesNoResult.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.mealzColor(.white))
                Button {
                    onNoResultsRedirect()
                } label: {
                    Text(Localization.catalog.browseRecipes.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                        .foregroundColor(Color.mealzColor(.primary))
                    Image.mealzIcon(icon: .caret)
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(Capsule().foregroundColor(.white))
                .overlay(Capsule().stroke(.white, lineWidth: 1.0))
            } else {
                Text("\(Localization.catalog.noRecipeFound.localised) \n\"\(searchText)\"")
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.mealzColor(.white))
                Text(Localization.catalog.tryAnotherSearch.localised)
                    .italic()
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(Color.mealzColor(.white))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(Dimension.sharedInstance.mPadding)
        .background(Color.mealzColor(.primary))
    }
}

@available(iOS 14, *)
struct MealzCatalogRecipesListNoResults_Previews: PreviewProvider {
    static var previews: some View {
        MealzCatalogRecipesListNoResults().content(
            catalogContent: CatalogContent.categoriesList,
            searchText: "",
            onNoResultsRedirect: {})
    }
}
