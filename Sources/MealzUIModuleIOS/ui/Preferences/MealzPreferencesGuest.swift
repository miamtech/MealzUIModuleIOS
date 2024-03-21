//
//  MealzPreferencesGuest.swift
//
//
//  Created by didi on 22/09/2023.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzPreferencesGuest: PreferencesGuestProtocol {
    public init() {}
    public func content(params: PreferencesGuestParameters) -> some View {
        VStack {
            if let guests = params.guests {
                HStack {
                    Text(Localization.preferences.numberOfGuests.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
                    Spacer()
                    MealzCounterView(count: guests) { count in
                        params.onGuestChanged(count)
                    }
                }
                .padding(Dimension.sharedInstance.mPadding)
            }
        }
    }
}

@available(iOS 14, *)
struct MealzPreferencesGuest_Previews: PreviewProvider {
    static var previews: some View {
        MealzPreferencesGuest().content(
            params: PreferencesGuestParameters(
                guests: 4,
                onGuestChanged: {_ in})
        )
    }
}
