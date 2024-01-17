//
//  MealzPreferencesSearchTag.swift
//  
//
//  Created by didi on 28/09/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzPreferencesSearchTag: BaseButtonProtocol {
    public init() {}
    public func content(buttonText: String, onButtonAction: @escaping () -> Void) -> some View {
        Button {
            onButtonAction()
        } label: {
            Text(buttonText)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                .padding(8)
        }
    }
}

@available(iOS 14, *)
struct MealzPreferencesSearchTag_Previews: PreviewProvider {
    static var previews: some View {
        MealzPreferencesSearchTag().content(
            buttonText: "Test",
            onButtonAction: { })
    }
}
