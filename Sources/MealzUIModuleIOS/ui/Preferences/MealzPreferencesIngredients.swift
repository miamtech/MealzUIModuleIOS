//
//  MealzPreferencesIngredients.swift
//  
//
//  Created by didi on 22/09/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzPreferencesIngredients: PreferencesIngredientsProtocol {
    public init() {}
    public func content(params: PreferencesIngredientsParameters) -> some View {
        
        MealzPreferencesTagsListView(
            title: Localization.preferences.tastesTitle.localised,
            subtitle: Localization.preferences.tastesSubtitle.localised,
            tags: params.ingredientsTag,
            geometry: params.geometry,
            onToggleTag: { tag in
                params.onTogglePreference(tag.tag.id)
            },
            onAddTagTapped: params.onGoToSearch)
        .padding(Dimension.sharedInstance.mPadding)
    }
}

@available(iOS 14, *)
struct MealzPreferencesIngredients_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            MealzPreferencesIngredients().content(
                params: PreferencesIngredientsParameters(
                ingredientsTag: [],
                geometry: geometry,
                onTogglePreference: {_ in},
                onGoToSearch: {})
                )
        }
    }
}
