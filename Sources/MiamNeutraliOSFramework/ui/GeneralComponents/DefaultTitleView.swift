//
//  DefaultTitleView.swift
//  MiamIOSFramework
//
//  Created by didi on 03/10/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct DefaultTitleView: BaseTitleProtocol {
    public init() {}
    public func content(
        title: String,
        subtitle: String?
    ) -> some View {
        return VStack {
            Text(title)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                .foregroundColor(Color.miamColor(.primary))
            if let subtitle = subtitle {
                Text(subtitle)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleSmallStyle)
                    .foregroundColor(Color.miamColor(.primary))
            }
        }
    }
}

@available(iOS 14, *)
struct DefaultTitleView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultTitleView().content(title: "Test", subtitle: nil)
    }
}
