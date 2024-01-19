//
//  MealzMyMealsEmpty.swift
//  
//
//  Created by didi on 12/10/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzMyMealsEmpty: EmptyProtocol {
    public init() {}
    public func content(params: BaseEmptyParameters) -> some View {
        VStack(spacing: Dimension.sharedInstance.lPadding) {
            Image.mealzIcon(icon: .feelingBlue)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
            Text(Localization.myMeals.noMealIdeaInBasket.localised)
                .foregroundColor(Color.mealzColor(.primary))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
                .multilineTextAlignment(.center)
            if let optionalCallBack = params.onOptionalCallback {
                Button {
                    withAnimation {
                        optionalCallBack()
                    }
                } label: {
                    Text(Localization.myMeals.goToCatalog.localised)
                        .foregroundColor(Color.mealzColor(.white))
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                }
                .padding(.horizontal)
                .padding(.vertical, 15)
                .background(Color.mealzColor(.primary))
                .cornerRadius(Dimension.sharedInstance.lCornerRadius)
                .overlay(RoundedRectangle(cornerRadius: Dimension.sharedInstance.lCornerRadius)
                    .stroke(Color.clear, lineWidth: 1.0)
                )
            }
        }
        .padding(Dimension.sharedInstance.lPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mealzColor(.white))
    }
}

@available(iOS 14, *)
struct MealzMyMealsEmpty_Previews: PreviewProvider {
    static var previews: some View {
        MealzMyMealsEmpty().content(params: BaseEmptyParameters(onOptionalCallback: {}))
    }
}
