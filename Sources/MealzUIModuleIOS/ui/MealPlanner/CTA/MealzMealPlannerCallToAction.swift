//
//  MiamBudgetCTA.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 26/04/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzMealPlannerCallToAction: MealPlannerCTAProtocol {
    public init() {}
    public func content(params: MealPlannerCTAViewParameters) -> some View {
        Button {
            params.onTapGesture()
        } label: {
            HStack {
                VStack {
                    Text(Localization.myBudget.myBudget.localised)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                        .foregroundColor(Color.mealzColor(.unpureWhite))
                    Spacer()
                        .frame(height: 10)
                    Text(Localization.myBudget.myBudgetSubtext.localised)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
                        .foregroundColor(Color.mealzColor(.unpureWhite))
                }
                Spacer()
                Image.mealzIcon(icon: .caret)
                    .renderingMode(.template)
                    .foregroundColor(Color.mealzColor(.white))
            }
            .padding(.vertical, 30)
            .padding()
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(
            //                    used to only show part of the pic we want (1/2 the quiche)
            GeometryReader { geometry in
                ZStack {
                    Color(.black)
                    Image.mealzIcon(icon: .mealPlannerCTA)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.60)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.size.height / 2.5)
                }
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: Dimension.sharedInstance.buttonCornerRadius))
    }
}
