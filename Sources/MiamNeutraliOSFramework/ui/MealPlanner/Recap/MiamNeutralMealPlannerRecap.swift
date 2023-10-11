//
//  MiamBudgetRecap.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 28/06/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import Foundation
import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralMealPlannerRecap: MealPlannerRecapProtocol {
    public init() {}
    public func content(
        numberOfMeals: Int,
        totalPrice: Double,
        onTapGesture: @escaping () -> Void
    ) -> some View {
        VStack(alignment: .center, spacing: 32.0) {
            HStack {
                Image.miamNeutralImage(icon: .success)
            }
            .padding(24.0)
            .frame(maxWidth: .infinity)
            .background(Color.miamNeutralColor(.lightBackgroundSuccess))
            .clipShape(RoundedRectangle(cornerRadius: 6.0))

            Text("Les produits associés ont bien été ajoutés au panier.")
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)

            HStack(alignment: .top) {
                    // Space Between
                Text("\(numberOfMeals) repas pour")
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                Spacer()
                    // Alternative Views and Spacers
                Text(totalPrice.currencyFormatted)
                    .foregroundColor(Color.miamNeutralColor(.primary))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            }
            .padding(16)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .inset(by: 0.5)
                    .stroke(Color.miamNeutralColor(.lightBorder), lineWidth: 1)
            )

            Divider()
                .frame(height: 1.0)

            Text("Découvrez aussi")
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            Button {

            } label: {
                Text("Nos promotions")
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
            }
            .padding(.vertical, Dimension.sharedInstance.lPadding)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.miamNeutralColor(.primary))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            Spacer()
        }
        .padding(Dimension.sharedInstance.lPadding)
    }
}

@available(iOS 14, *)
struct MiamNeutralMealPlannerRecapPreviews: PreviewProvider {
    static var previews: some View {
        MiamNeutralMealPlannerRecap().content(
            numberOfMeals: 4,
            totalPrice: 34.32) {
        }
    }
}
