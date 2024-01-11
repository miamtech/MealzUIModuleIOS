//
//  MiamNeutralGeneralEmpty.swift
//  
//
//  Created by didi on 08/08/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralGeneralEmpty: EmptyProtocol {
    public init() {}
    public func content(onOptionalCallback: (() -> Void)?) -> some View {
        VStack {
            Image.mealzIcon(icon: .feelingBlue)
            Text(Localization.catalog.tryAnotherSearch.localised)
                .foregroundColor(Color.mealzColor(.primary))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
                .multilineTextAlignment(.center)
        }
    }
}

@available(iOS 14, *)
struct MiamNeutralGeneralEmpty_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralGeneralEmpty().content(onOptionalCallback: nil)
    }
}
