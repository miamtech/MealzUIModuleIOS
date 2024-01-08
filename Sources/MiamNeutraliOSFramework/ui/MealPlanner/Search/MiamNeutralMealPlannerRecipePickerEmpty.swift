//
//  MiamNeutralMealPlannerRecipePickerEmpty.swift
//  
//
//  Created by didi on 10/10/2023.
//

import MiamIOSFramework
import SwiftUI

@available(iOS 14, *)
public struct MiamNeutralMealPlannerRecipePickerEmpty: EmptyProtocol {
    public func content(onOptionalCallback: (() -> Void)?) -> some View {
            VStack {
                Text(Localization.catalog.noRecipeFound.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                    .padding(.top, 35)
                Text(Localization.catalog.noRecipeFound.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
                Spacer()
            }
    }
}
