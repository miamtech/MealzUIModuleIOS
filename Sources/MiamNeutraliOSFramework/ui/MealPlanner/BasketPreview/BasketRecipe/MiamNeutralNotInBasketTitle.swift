//
//  MiamNeutralNotInBasketTitle.swift
//
//
//  Created by Diarmuid McGonagle on 09/01/2024.
//

import Foundation
import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public class MiamNeutralNotInBasketTitle: BaseButtonProtocol {
    public init() {}
    public func content(buttonText: String, onButtonAction: @escaping () -> Void) -> some View {
        Button(action: {
            onButtonAction()
        }, label: {
            Text(buttonText)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
        })
        .padding(Dimension.sharedInstance.lPadding)
        .frame(maxWidth: .infinity)
    }
}
