//
//  MiamNeutralRecipeDetailsStepsView.swift
//
//
//  Created by didi on 7/6/23.
//

import SwiftUI
import MiamIOSFramework
import miamCore

//@available(iOS 14, *)
//public struct MiamNeutralRecipeDetailsStepsView: RecipeDetailsStepsProtocol {
//    
//    public init() {}
//    
//    public func content(
//        activeStep: Binding<Int>,
//        steps: [RecipeStep]
//    ) -> some View {
//        HStack {
//            Text(Localization.recipe.steps.localised)
//                .foregroundColor(Color.black)
//                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
//                .padding(Dimension.sharedInstance.lPadding)
//            Spacer()
//        }.padding(.top, Dimension.sharedInstance.lPadding)
//        // Steps
//        Divider()
//            .background(Color.miamColor(.lightGreyBackground))
//            .padding(.horizontal, Dimension.sharedInstance.lPadding)
//        // Steps ListView
//        VStack {
//            VStack {
//                ForEach(Array(steps.enumerated()), id: \.element) { index, step in
//                    let isChecked = activeStep.wrappedValue > index
//                    MiamNeutralRecipeDetailsStepRow(
//                        index: index,
//                        step: step,
//                        isCheck: isChecked,
//                        onToogleCheckbox: {
//                            activeStep.wrappedValue = index + 1
//                        }
//                    )
//                }
//            }.padding(.vertical, Dimension.sharedInstance.lPadding)
//        }.padding( .horizontal, Dimension.sharedInstance.lPadding)
//    }
//}


@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsStepsView: RecipeDetailsStepsProtocol {
    
    public init() {}
    public func content(
        activeStep: Binding<Int>,
        steps: [RecipeStep]
    ) -> some View {
        Text("\(steps.count) Etapes").bold().padding(.horizontal).frame(maxWidth: .infinity, alignment: .leading).padding(.top)

        VStack(){
            ForEach(steps,id: \.self.id) {step in
                RecipeDetailStep(stepNumber: Int(step.attributes?.stepNumber ?? 0) + 1, stepDescription: step.attributes?.stepDescription ?? "")
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}


@available(iOS 14, *)
struct RecipeDetailStep : View {
    var stepNumber: Int
    var stepDescription: String
    
    var body: some View {
        HStack{
            Text("\(stepNumber)").foregroundColor(.black).frame(width: 40, height: 40).background(Circle().fill(Color.miamColor(.backgroundSecondary))).padding(.horizontal)
            Text(stepDescription)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                .padding(.trailing, 16).frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
