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
            Button(action: goBack, label: { Text(" return")})
            if hasNoSubstitutes {
                Text("No subs")
            } else { Text("best search") }
        }
    }
}
