//
//  MiamNeutralGeneralSearch.swift
//  
//
//  Created by didi on 21/09/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralGeneralSearch: GeneralSearchViewTemplate {
    private let hasButton: Bool
    public init(hasButton: Bool = true) {
        self.hasButton = hasButton
    }
    public func content(
        searchText: Binding<String>,
        apply: @escaping () -> Void
    ) -> some View {
        VStack(spacing: 10.0) {
            HStack(spacing: 10.0) {
                HStack(spacing: 10.0) {
                    TextField(Localization.catalog.searchTitle.localised, text: searchText).frame(height: 45.0)
                        .disableAutocorrection(true)
                    if hasButton {
                        Button {
                            apply()
                        } label: {
                            Image.miamImage(icon: .search)
                                .renderingMode(.template)
                                .foregroundColor(Color.miamColor(.white))
                                .padding(10)
                                .background(Color.miamColor(.primary)).clipShape(Circle())
                                .shadow(radius: 2.0)
                        }
                    }
                }
                .padding([.leading], 16).frame(height: 45.0)
                .padding([.trailing], 2)
                .overlay(Capsule().stroke(Color.gray, lineWidth: 1.0))
            }.padding(10)
            Spacer()
        }
    }
}

@available(iOS 14, *)
struct MiamNeutralGeneralSearch_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralGeneralSearch().content(
            searchText: .constant(""),
            apply: {})
    }
}