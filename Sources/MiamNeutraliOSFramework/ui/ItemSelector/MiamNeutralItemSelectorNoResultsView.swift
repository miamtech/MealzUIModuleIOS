//
//  MiamNeutralItemSelectorNoResultsView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralItemSelectorNoResultsView: ItemSelectorNoResultsProtocol {
    public init() {}
    public func content(title: String, subtitle: String?, hasNoSubstitutes: Bool, goBack: @escaping () -> Void) -> some View {
        VStack {
            Image.mealzIcon(icon: .feelingBlue)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
            Text(title)
                .foregroundColor(Color.mealzColor(.primary))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
            if let subtitle {
                Text(subtitle)
                    .foregroundColor(Color.mealzColor(.primary))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
            }
        }
    }
}
