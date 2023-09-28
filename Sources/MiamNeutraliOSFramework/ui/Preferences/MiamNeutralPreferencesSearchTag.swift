//
//  MiamNeutralPreferencesSearchTag.swift
//  
//
//  Created by didi on 28/09/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MiamNeutralPreferencesSearchTag: GeneralButtonViewTemplate {
    public init() {}
    public func content(buttonText: String, buttonAction: @escaping () -> Void) -> some View {
        Button {
            buttonAction()
        } label: {
            Text(buttonText)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                .padding(8)
        }
    }
}

@available(iOS 14, *)
struct MiamNeutralPreferencesSearchTag_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralPreferencesSearchTag().content(
            buttonText: "Test",
            buttonAction: { })
    }
}
