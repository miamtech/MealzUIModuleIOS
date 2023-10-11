//
//  MiamNeutralPreferencesDietSection.swift
//  
//
//  Created by didi on 22/09/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MiamNeutralPreferencesDiet: PreferencesDietProtocol {
    public init() {}
    public func content(
        dietsTag: [CheckableTag],
        togglePreference: @escaping (String) -> Void
    ) -> some View {
        PreferencesListView(
            title: Localization.preferences.dietTitle.localised,
             subtitle: Localization.preferences.dietSubtitle.localised,
            preferences: dietsTag) { tag in
                togglePreference(tag.tag.id)
        }
    }
}

@available(iOS 14, *)
struct MiamNeutralPreferencesDiet_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralPreferencesDiet().content(
            dietsTag: [],
            togglePreference: {_ in})
    }
}
