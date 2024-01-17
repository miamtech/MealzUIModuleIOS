//
//  MealzMealPlannerResultsEmpty.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 26/04/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzMealPlannerResultsEmpty: MealPlannerResultsEmptyProtocol {
    
    public init() {}
    public func content(mealPlannerCriteria: MealPlannerCriteria, reason: String) -> some View {
        
        VStack(alignment: .leading, spacing: 8.0) {
            Image.mealzIcon(icon: .alert)
                .padding([.top, .leading], 12.0)
            Text(reason)
                .foregroundColor(Color.mealzColor(.danger))
                .lineLimit(5)
                .padding([.leading, .trailing, .bottom], 12.0)
        }
        .background(RoundedRectangle(cornerRadius: 6.0).foregroundColor(Color.mealzColor(.salmon)))
    }
}
