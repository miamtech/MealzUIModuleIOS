//
//  MealzPreferencesDietSection.swift
//  
//
//  Created by didi on 22/09/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzPreferencesDiet: PreferencesDietProtocol {
    public init() {}
    public func content(params: PreferencesDietParameters) -> some View {
        MealzPreferencesListView(
            title: Localization.preferences.dietTitle.localised,
             subtitle: Localization.preferences.dietSubtitle.localised,
            preferences: params.dietsTag) { tag in
                params.onTogglePreference(tag.tag.id)
        }
    }
}

@available(iOS 14, *)
struct MealzPreferencesDiet_Previews: PreviewProvider {
    static var previews: some View {
        MealzPreferencesDiet().content(
            params: PreferencesDietParameters(
            dietsTag: [],
            onTogglePreference: {_ in})
            )
    }
}
