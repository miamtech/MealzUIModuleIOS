//
//  MealzRecipeDetailsStepRow.swift
//  
//
//  Created by didi on 13/10/2023.
//

import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzRecipeDetailsStepRow: View {
    private var index: Int
    private var step: RecipeStep
    private var onToogleCheckbox: () -> Void
    private var checkState: Bool

    public init(index: Int, step: RecipeStep, isCheck: Bool, onToogleCheckbox: @escaping() -> Void ) {
        self.index = index
        self.step = step
        self.onToogleCheckbox = onToogleCheckbox
        checkState = isCheck
    }

    public var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.mealzColor(.primaryText))
                    .frame(width: 35.0, height: 35.0)
                Text(String(index+1))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(Color.mealzColor(.white))
                    .frame( alignment: .center)
            }

            Text(step.attributes?.stepDescription ?? "")
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                .foregroundColor(Color.mealzColor(.darkestGray))
                .multilineTextAlignment(.leading)
                .padding(Dimension.sharedInstance.mPadding).fixedSize(horizontal: false, vertical: true)
            Spacer()
            Button {
                onToogleCheckbox()
            } label: {
                ZStack(alignment: .center) {
                       Rectangle()
                        .fill(.white)
                        .cornerRadius(5)
                        .border(.black, width: 1)
                                .frame(width: 20, height: 20, alignment: .center)

                    if self.checkState {
                        Image.mealzIcon(icon: .check)
                            .renderingMode(.original)
                            .frame( alignment: .center)
                    }
                }.animation(.none)
            }
            .foregroundColor(Color.white)
        }
    }
}
