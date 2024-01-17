//
//  MealzPreferencesGuest.swift
//  
//
//  Created by didi on 22/09/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzPreferencesGuest: PreferencesGuestProtocol {
    public init() {}
    public func content(
        guests: Int?,
        onGuestChanged: @escaping (Int) -> Void
    ) -> some View {
        return HStack {
            Text(Localization.preferences.numberOfGuests.localised)
            Spacer()
            if let guests {
                MealzCounterView(count: guests) { count in
                    onGuestChanged(count)
                }
            }
        }.background(Color.mealzColor(.lightBackground))
    }
}

@available(iOS 14, *)
struct MealzPreferencesGuest_Previews: PreviewProvider {
    static var previews: some View {
        MealzPreferencesGuest().content(
            guests: 4,
            onGuestChanged: {_ in})
    }
}
