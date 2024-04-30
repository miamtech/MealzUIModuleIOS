//
//  MiamBudgetSearch.swift
//  MealzIOSFramework
//
//  Created by Vincent Kergonna on 26/04/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzMealPlannerSearch: SearchProtocol {
    public init() {}
    public func content(params: SearchParameters) -> some View {
        HStack(spacing: 8.0) {
            HStack(spacing: 4.0) {
                Image.mealzIcon(icon: .search)
                    .renderingMode(.template)
                    .foregroundColor(Color.mealzColor(.primary))
                TextField(Localization.itemSelector.search.localised, text: params.searchText, onCommit: {
                    // TODO: Enter pressed, start searching? Or start searching everytime a char is entered?
                })
                .frame(maxWidth: .infinity)
                .autocorrectionDisabled(true)

            }
            .padding(Dimension.sharedInstance.mPadding)
            .overlay(RoundedRectangle(cornerRadius: Dimension.sharedInstance.mCornerRadius).stroke(Color.mealzColor(.border), lineWidth: 1.0))

            Button {
                params.onApply()
            } label: {
                Image.mealzIcon(icon: .filters)
                    .renderingMode(.template)
                    .foregroundColor(Color.mealzColor(.primary))
            }
        }
        .padding(Dimension.sharedInstance.lPadding)
    }
}

@available(iOS 14, *)
struct MealzMealPlannerSearchh_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.blue
            BudgetSearchWrapper()
        }
    }
    
    struct BudgetSearchWrapper: View {
        @SwiftUI.State var text = ""
        
        var body: some View {
            VStack {
                MealzMealPlannerSearch()
                    .content(params: SearchParameters(searchText: $text, onApply: {}))
            }
        }
    }
}
