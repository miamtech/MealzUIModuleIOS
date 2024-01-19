//
//  MealzGeneralSearch.swift
//  
//
//  Created by didi on 21/09/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzGeneralSearch: SearchProtocol {
    
    private let hasButton: Bool
    public init(hasButton: Bool = true) {
        self.hasButton = hasButton
    }
    public func content(params: SearchParameters) -> some View {
        VStack(spacing: 10.0) {
            HStack(spacing: 10.0) {
                HStack(spacing: 10.0) {
                    TextField(Localization.catalog.searchTitle.localised, text: params.searchText)
                        .frame(height: 45.0)
                        .disableAutocorrection(true)
                    if hasButton {
                        Button {
                            params.onApply()
                        } label: {
                            Image.mealzIcon(icon: .search)
                                .renderingMode(.template)
                                .foregroundColor(Color.mealzColor(.white))
                                .padding(10)
                                .background(Color.mealzColor(.primary)).clipShape(Circle())
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
struct MealzGeneralSearch_Previews: PreviewProvider {
    static var previews: some View {
        MealzGeneralSearch().content(params: SearchParameters(
            searchText: .constant(""),
            onApply: {}))
    }
}
