//
//  MealzGeneralEmpty.swift
//  
//
//  Created by didi on 08/08/2023.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzGeneralEmpty: EmptyProtocol {
    public init() {}
    public func content(params: BaseEmptyParameters) -> some View {
        VStack(spacing: Dimension.sharedInstance.mPadding) {
            Image.mealzIcon(icon: .feelingBlue)
            Text(Localization.catalog.noRecipeFound.localised)
                .foregroundColor(Color.mealzColor(.standardDarkText))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
                .multilineTextAlignment(.center)
            if let onOptionalCallback = params.onOptionalCallback {
                Button(action: onOptionalCallback, label: {
                    Text(Localization.catalog.tryAnotherSearch.localised)
                        .foregroundColor(Color.mealzColor(.primary))
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                        .multilineTextAlignment(.center)
                })
            }
        }
    }
}

@available(iOS 14, *)
struct MealzGeneralEmpty_Previews: PreviewProvider {
    static var previews: some View {
        MealzGeneralEmpty().content(params: BaseEmptyParameters())
    }
}
