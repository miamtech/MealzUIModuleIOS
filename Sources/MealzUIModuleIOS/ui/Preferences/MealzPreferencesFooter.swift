//
//  MealzPreferencesFooter.swift
//  
//
//  Created by didi on 22/09/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzPreferencesFooter: PreferencesFooterProtocol {
    public init() {}
    public func content(
        recipesFound: Int?,
        onApplied: @escaping () -> Void,
        onClosed: @escaping () -> Void
    ) -> some View {
        var createCTAText: String {
            if let recipesFoundText = recipesFound {
                return Localization.catalog.showResults(numberOfResults: Int32(recipesFoundText)).localised
            } else { return Localization.catalog.showAll.localised }
        }
        return HStack {
            Button {
                onClosed()
            } label: {
                Text(Localization.preferences.cancel.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                    .foregroundColor(Color.mealzColor(.darkestGray))
            }
            .frame(maxWidth: .infinity)
            .fixedSize(horizontal: false, vertical: true)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(
                Capsule().foregroundColor(Color.mealzColor(.white)))
            .overlay(
                Capsule().stroke(Color.mealzColor(.border), lineWidth: 1.0))
            Button {
                onApplied()
            } label: {
                Text(createCTAText)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                    .foregroundColor(Color.mealzColor(.white))
            }
            .frame(maxWidth: .infinity)
            .fixedSize(horizontal: false, vertical: true)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Capsule().foregroundColor(Color.mealzColor(.primary)))
        }
        .padding(.horizontal, Dimension.sharedInstance.lPadding)
        .background(Color.mealzColor(.white))
    }
}

@available(iOS 14, *)
struct MealzPreferencesFooter_Previews: PreviewProvider {
    static var previews: some View {
        MealzPreferencesFooter().content(
            recipesFound: 4,
            onApplied: {},
            onClosed: {}
        )
    }
}
