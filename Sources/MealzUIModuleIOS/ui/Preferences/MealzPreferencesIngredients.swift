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
    public func content(
        ingredientsTag: [CheckableTag],
        geometry: GeometryProxy,
        onTogglePreference: @escaping (String) -> Void,
        onGoToSearch: @escaping () -> Void
    ) -> some View {
        
        MealzPreferencesTagsListView(
            title: Localization.preferences.tastesTitle.localised,
            subtitle: Localization.preferences.tastesSubtitle.localised,
            tags: ingredientsTag,
            geometry: geometry,
            onToggleTag: { tag in
                onTogglePreference(tag.tag.id)
            },
            onAddTagTapped: onGoToSearch)
    }
}

@available(iOS 14, *)
struct MealzPreferencesIngredients_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            MealzPreferencesIngredients().content(
                ingredientsTag: [],
                geometry: geometry,
                onTogglePreference: {_ in},
                onGoToSearch: {})
        }
    }
}
