//
//  MealzRecipeCardLoading.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 29/05/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzRecipeCardLoading: RecipeCardLoadingProtocol {
    private struct Constants {
        static let duration: Double = 1.3
        static let minOpacity: Double = 0.25
        static let maxOpacity: Double = 1.0
    }
    private let linePlaceholderHeight = 13.0
    private let linePlaceholderCornerRadius = 18.0

    let dimensions = Dimension.sharedInstance
    @State private var opacity: Double = Constants.minOpacity
    public init() {}
    internal struct IconAndTextLoadingView: View {
        private let linePlaceholderWidth = 44.0
        private let linePlaceholderCornerRadius = 18.0
        private let linePlaceholderHeight = 13.0
        private let iconPlaceholderWidth = 18.0
        private let iconPlaceholderHeight = 22.0
        private let iconPlaceholderCornerRadius = 22.0
        var body: some View {
            VStack {
                RoundedRectangle(cornerRadius: iconPlaceholderCornerRadius)
                    .fill(Color.mealzColor(.lightBackground))
                    .frame(width: iconPlaceholderWidth, height: iconPlaceholderHeight)

                RoundedRectangle(cornerRadius: linePlaceholderCornerRadius)
                    .fill(Color.mealzColor(.lightBackground))
                    .frame(width: linePlaceholderWidth, height: linePlaceholderHeight)
            }
        }
    }

    public func content(recipeCardDimensions: CGSize) -> some View {
        VStack(alignment: .center, spacing: 0.0) {
            Rectangle()
                .fill(Color.mealzColor(.lightBackground))
                .frame(width: 150.0)

            VStack(alignment: .center, spacing: dimensions.xlPadding) {
                VStack {
                    RoundedRectangle(cornerRadius: linePlaceholderCornerRadius)
                        .fill(Color.mealzColor(.lightBackground))
                        .frame(width: 140.0, height: linePlaceholderHeight)
                    RoundedRectangle(cornerRadius: linePlaceholderCornerRadius)
                        .fill(Color.mealzColor(.lightBackground))
                        .frame(width: 160.0, height: linePlaceholderHeight)
                }

                HStack(spacing: dimensions.xlPadding) {
                    IconAndTextLoadingView()
                    IconAndTextLoadingView()
                }
                RoundedRectangle(cornerRadius: linePlaceholderCornerRadius)
                    .fill(Color.mealzColor(.lightBackground))
                    .frame(width: 70.0, height: linePlaceholderHeight)
            }
            .frame(maxHeight: .infinity)
            .padding(.top, dimensions.lPadding)
            .padding([.leading, .trailing], dimensions.lPadding)
        }
        .frame(width: recipeCardDimensions.width, height: recipeCardDimensions.height)
        .redacted(reason: .placeholder).opacity(opacity)
        .cornerRadius(12.0)
        .overlay(RoundedRectangle(cornerRadius: 12.0).stroke(Color.mealzColor(.border), lineWidth: 1.0))
        .transition(.opacity).onAppear {
            let baseAnimation = Animation.easeInOut(duration: Constants.duration)
            let repeated = baseAnimation.repeatForever(autoreverses: true)
            withAnimation(repeated) {
                self.opacity = Constants.maxOpacity
            }
        }
    }
}

@available(iOS 14, *)
struct RecipeCardLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        MealzRecipeCardLoading().content(recipeCardDimensions: CGSize(width: 100, height: 200))
    }
}
