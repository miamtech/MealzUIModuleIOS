//
//  MiamBudgetPlannerStickyFooter.swift
//  MiamIOSFramework
//
//  Created by didi on 5/23/23.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralMealPlannerStickyFooter: MealPlannerResultsFooterProtocol {
    
    let dimension = Dimension.sharedInstance
    public init() {}
    public func content(
        mealPlannerCriteria: MealPlannerCriteria,
        budgetSpent: Binding<Double>,
        onValidateTapped: @escaping () -> Void
    ) -> some View {
        VStack {
            MiamNeutralMealPlannerBudgetFooter(
                budgetSpent: budgetSpent.wrappedValue,
                totalBudgetPermitted: mealPlannerCriteria.availableBudget)
            MiamNeutralMealPlannerCTAFooter(onButtonAction: onValidateTapped)
        }
    }
}

@available(iOS 14, *)
struct MiamNeutralMealPlannerCTAFooter: View {
    let onButtonAction: () -> Void
    let dimension = Dimension.sharedInstance
    var body: some View {
        Button {
            withAnimation {
                onButtonAction()
            }
        } label: {
            HStack {
                Image.mealzIcon(icon: .basket)
                    .renderingMode(.template)
                    .foregroundColor(Color.miamColor(.white))
                    .frame(width: dimension.mButtonHeight, height: dimension.mButtonHeight)
                Text(Localization.recipe.add.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                    .padding(dimension.lPadding)
                    .foregroundColor(Color.miamColor(.white))
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.miamColor(.primary))
    }
}

@available(iOS 14, *)
struct WithRoundedCornersProgressViewStyle: ProgressViewStyle {
    var progressColor: Color
    var overBudget: Bool
    let widthOfRectangles = CGFloat(250)
    let dimension = Dimension.sharedInstance
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: dimension.lCornerRadius)
                .frame(width: widthOfRectangles, height: 10)
                .foregroundColor(Color.miamColor(.greySurface))
            Rectangle()
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * widthOfRectangles, height: 10)
                .foregroundColor(progressColor)
                .cornerRadius(dimension.lCornerRadius, corners: [.topLeft, .bottomLeft])
            // round end corners if == to 100
                .cornerRadius(dimension.lCornerRadius, corners: (configuration.fractionCompleted ?? 0 > 0.99) ? .allCorners : .left)
            if overBudget {
                HStack {
                    Spacer()
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(width: 0.3 * widthOfRectangles, height: 10)
                        .foregroundColor(Color.miamColor(.danger))
                        .cornerRadius(dimension.lCornerRadius, corners: .right)
                }
            }
        }
    }
}

@available(iOS 14, *)
struct MiamNeutralMealPlannerBudgetFooter: View {
    var budgetSpent: Double
    var totalBudgetPermitted: Double
    let dimension = Dimension.sharedInstance
    var body: some View {
        HStack(spacing: dimension.lPadding) {
            ProgressView(value: budgetSpent, total: totalBudgetPermitted)
                .progressViewStyle(WithRoundedCornersProgressViewStyle(
                    progressColor: Color.miamNeutralColor(.primary),
                    overBudget: budgetSpent > totalBudgetPermitted ? true : false))
            Text(budgetSpent.currencyFormatted)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                .foregroundColor(budgetSpent > totalBudgetPermitted ?
                                 Color.miamColor(.danger) : Color.miamNeutralColor(.textSuccess))
        }
        .padding([.top, .horizontal], dimension.lPadding)
    }
}

@available(iOS 14, *)
struct MiamNeutralMealPlannerStickyFooter_Previews: PreviewProvider {

    static var previews: some View {
        let mealPlannerCriteria = MealPlannerCriteria(
            availableBudget: 50.0,
            numberOfGuests: 4,
            numberOfMeals: 4)

        GeometryReader { geometry in
            let safeArea = geometry.safeAreaInsets
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack {
                        LazyVStack(spacing: 0) {
                            ForEach(1..<11) { index in
                                VStack {
                                    Text("hello world \(index)")
                                    AsyncImage(url: URL(string: "https://picsum.photos/200/300")!) { image in
                                        image
                                            .resizable()
                                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, (geometry.safeAreaInsets.bottom + 150)) // Add padding for safe area at bottom
                    }
                }
//                StickyFooter(safeArea: safeArea) {
                MiamNeutralMealPlannerStickyFooter().content(mealPlannerCriteria: mealPlannerCriteria, budgetSpent: .constant(50.0)) {
                        print("hello world")
                    }
//                }
                .frame(maxWidth: .infinity)
            }.ignoresSafeArea()
        }
    }
}

@available(iOS 14, *)
struct StickyFooter<Content: View>: View {
    var safeArea: EdgeInsets
    let content: () -> Content
    var body: some View {
        content()
            .padding(.bottom, safeArea.bottom)
            .background(Color.miamColor(.white))
    }
}
