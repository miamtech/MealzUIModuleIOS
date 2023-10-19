//
//  MiamBudgetSearch.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 26/04/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralMealPlannerSearch: SearchProtocol {
    public init() {}
    public func content(searchText: Binding<String>, onApply: @escaping () -> Void) -> some View {
        HStack(spacing: 8.0) {
            HStack(spacing: 4.0) {
                Image.miamNeutralImage(icon: .search)
                    .renderingMode(.template)
                    .foregroundColor(Color.miamNeutralColor(.primary))
                TextField("Rechercher", text: searchText, onCommit: {
                    // TODO: Enter pressed, start searching? Or start searching everytime a char is entered?
                })
                .frame(maxWidth: .infinity)
                .autocorrectionDisabled(true)

            }
            .padding(Dimension.sharedInstance.mPadding)
            .overlay(RoundedRectangle(cornerRadius: Dimension.sharedInstance.mCornerRadius).stroke(Color.miamNeutralColor(.lightBorder), lineWidth: 1.0))

            Button {
                onApply()
            } label: {
                Image.miamNeutralImage(icon: .filters)
            }
        }
        .padding(Dimension.sharedInstance.lPadding)
    }
}
