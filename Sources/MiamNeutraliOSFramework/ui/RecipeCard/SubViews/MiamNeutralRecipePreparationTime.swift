//
//  RecipePreparationTime.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 04/05/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipePreparationTime: View {
    var duration: String

    public init(duration: String) {
        self.duration = duration
    }

    public var body: some View {
        VStack {
            Image.mealzIcon(icon: .time)
                .renderingMode(.template)
                .foregroundColor(Color.mealzColor(.primary))
            Text(duration.spellOutTimeUnit())
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
        }
    }
}

@available(iOS 14, *)
struct MiamNeutralRecipePreparationTime_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralRecipePreparationTime(duration: "10 min.")
    }
}
