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
    public func content(params: TitleParameters) -> some View {
        return VStack {
            Text(params.title)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                .foregroundColor(Color.mealzColor(.primary))
            if let subtitle = params.subtitle {
                Text(subtitle)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleSmallStyle)
                    .foregroundColor(Color.mealzColor(.primary))
            }
        }
    }
}

@available(iOS 14, *)
struct DefaultTitleView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultTitleView().content(params: TitleParameters(title: "Test", subtitle: nil))
    }
}
