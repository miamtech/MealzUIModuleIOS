//
//  MiamBudgetPlannerLoading.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 26/04/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralMealPlannerLoading: LoadingProtocol {
    public init() {}
    public func content() -> some View {
        VStack {
            HStack {
                ProgressLoader(color: Color.mealzColor(.primary))
            }
        }
    }
}
