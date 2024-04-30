//
//  MealzMealPlannerRecipePickerEmpty.swift
//  
//
//  Created by didi on 10/10/2023.
//

import MealzIOSFramework
import SwiftUI

@available(iOS 14, *)
public struct MealzMealPlannerRecipePickerEmpty: EmptyProtocol {
    public func content(params: BaseEmptyParameters) -> some View {
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
