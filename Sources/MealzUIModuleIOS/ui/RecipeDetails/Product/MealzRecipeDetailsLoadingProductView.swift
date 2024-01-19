//
//  MealzRecipeDetailsLoadingProductView.swift
//
//
//  Created by Diarmuid McGonagle on 12/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzRecipeDetailsLoadingProductView: LoadingProtocol {
    public init() {}
    let dim = Dimension.sharedInstance
    private let linePlaceholderHeight = 13.0
    public func content(params: BaseLoadingParameters) -> some View {
        VStack {
            VStack {
                RoundedRectangle(cornerRadius: dim.lCornerRadius)
                    .fill(Color.mealzColor(.lightBackground))
                    .frame(width: 140.0, height: linePlaceholderHeight)
                RoundedRectangle(cornerRadius: dim.lCornerRadius)
                    .fill(Color.mealzColor(.lightBackground))
                    .frame(width: 160.0, height: linePlaceholderHeight)
            }
        }
        .frame(height: mealzProductHeight)
        .frame(maxWidth: .infinity)
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: dim.mCornerRadius)
                .stroke(Color.mealzColor(.lightBackground), lineWidth: 1)
        )
        .padding(.horizontal, dim.mPadding)
    }
}
