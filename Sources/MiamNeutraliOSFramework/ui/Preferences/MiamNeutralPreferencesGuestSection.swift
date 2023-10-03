//
//  MiamNeutralPreferencesGuest.swift
//  
//
//  Created by didi on 22/09/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralPreferencesGuest: PreferencesGuestViewTemplate {
    public init() {}
    public func content(guests: Int?, guestChanged: @escaping (Int) -> Void) -> some View {
        return HStack {
            Text(Localization.preferences.numberOfGuests.localised)
            Spacer()
            CounterView(count: guests) { count in
                guestChanged(count)
            }
        }.background(Color.miamColor(.greyLighter))
    }
}

@available(iOS 14, *)
struct MiamNeutralPreferencesGuest_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralPreferencesGuest().content(
            guests: 4,
            guestChanged: {_ in})
    }
}