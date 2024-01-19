//
//  MealzPreferencesEquipment.swift
//  
//
//  Created by didi on 22/09/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzPreferencesEquipment: PreferencesEquipmentProtocol {
    public init() {}
    public func content(params: PreferencesEquipmentParameters) -> some View {
        MealzPreferencesListView(
            title: Localization.preferences.cookingEquipmentTitle.localised,
             subtitle: Localization.preferences.cookingEquipmentSubtitle.localised,
            preferences: params.equipmentsTag) { tag in
                params.onTogglePreference(tag.tag.id)
        }
    }
}

@available(iOS 14, *)
struct MealzPreferencesEquipment_Previews: PreviewProvider {
    static var previews: some View {
        MealzPreferencesEquipment().content(
            params: PreferencesEquipmentParameters(
            equipmentsTag: [],
            onTogglePreference: {_ in})
            )
    }
}
