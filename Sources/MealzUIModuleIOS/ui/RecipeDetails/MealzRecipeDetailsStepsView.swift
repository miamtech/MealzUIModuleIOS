//
//  MealzRecipeDetailsStepsView.swift
//
//
//  Created by didi on 7/6/23.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzRecipeDetailsStepsView: RecipeDetailsStepsProtocol {
    
    public init() {}
    public func content(
        activeStep: Binding<Int>,
        steps: [RecipeStep]
    ) -> some View {
        VStack(alignment: .leading) {
            Text("\(steps.count) \(Localization.recipe.steps.localised)")
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                .padding()
            
            VStack {
                ForEach(steps,id: \.self.id) {step in
                    RecipeDetailStep(stepNumber: Int(step.attributes?.stepNumber ?? 0) + 1, stepDescription: step.attributes?.stepDescription ?? "")
                }
                .padding(.bottom)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


@available(iOS 14, *)
struct RecipeDetailStep : View {
    var stepNumber: Int
    var stepDescription: String
    
    var body: some View {
        HStack{
            Text("\(stepNumber)")
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
                .foregroundColor(Color.mealzColor(.standardDarkText))
                .frame(width: 40, height: 40)
                .background(
                    Circle().fill(Color.mealzColor(.lightBackground)))
                .padding(.horizontal)
            Text(stepDescription)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                .foregroundColor(Color.mealzColor(.standardDarkText))
                .padding(.trailing, 16).frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}