//
//  MealzRecipeTimeView.swift
//  
//
//  Created by didi on 13/10/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
struct MealzRecipeTimeView: View {
    let preparationTime: String
    let cookingTime: String
    let restingTime: String
    
    let noPreparationTime = "0s"
    let noCookingTime = "0s"
    let noRestingTime = "0s"
    
    let spaceBetweenTime: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            if preparationTime != noPreparationTime {
                HStack(spacing: spaceBetweenTime) {
                    Text(Localization.recipe.preparationTime.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                    Text(preparationTime.spellOutTimeUnit())
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
                }
            }
            if cookingTime != noCookingTime {
                HStack(spacing: spaceBetweenTime) {
                    Text(Localization.recipe.cookTime.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                    Text(cookingTime.spellOutTimeUnit())
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
                }
            }
            if restingTime != noRestingTime {
                HStack(spacing: spaceBetweenTime) {
                    Text(Localization.recipe.restingTime.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                    Text(restingTime.spellOutTimeUnit())
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
                }
            }
            Spacer()
        }
    }
}

@available(iOS 14, *)
struct MealzRecipeTimeView_Previews: PreviewProvider {
    static var previews: some View {
        MealzRecipeTimeView(
            preparationTime: "10m", cookingTime: "10m", restingTime: "10m"
        )
    }
}
