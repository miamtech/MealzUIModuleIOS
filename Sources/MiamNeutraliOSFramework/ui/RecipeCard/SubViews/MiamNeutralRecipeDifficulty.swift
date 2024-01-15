//
//  MiamNeutralRecipeDifficulty.swift
//  
//
//  Created by didi on 13/10/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDifficulty: View {
    let difficulty: Int

    public init(difficulty: Int) {
        self.difficulty = difficulty
    }

    public var body: some View {
        VStack {
            Image.mealzIcon(icon: .chefHat)
                .renderingMode(.template)
                .foregroundColor(Color.mealzColor(.primary))
            Text(difficultyDescription)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
        }
    }

    var difficultyDescription: String {

        switch difficulty {
        case 1: return Localization.recipe.lowDifficulty.localised
        case 2: return Localization.recipe.mediumDifficulty.localised
        default: return Localization.recipe.highDifficulty.localised
        }
    }
}

@available(iOS 14, *)
struct MiamNeutralRecipeDifficulty_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MiamNeutralRecipeDifficulty(difficulty: 1)
            MiamNeutralRecipeDifficulty(difficulty: 2)
            MiamNeutralRecipeDifficulty(difficulty: 3)
        }
    }
}
