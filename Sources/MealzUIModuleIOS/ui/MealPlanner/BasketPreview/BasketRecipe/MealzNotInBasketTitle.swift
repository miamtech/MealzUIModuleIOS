//
//  MealzNotInBasketTitle.swift
//
//
//  Created by Diarmuid McGonagle on 09/01/2024.
//

import Foundation
import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public class MealzNotInBasketTitle: BaseButtonProtocol {
    public init() {}
    public func content(params: BaseButtonParameters) -> some View {
        Button(action: {
            withAnimation { params.onButtonAction() }
        }, label: {
            HStack {
                Text(params.buttonText)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(Color.mealzColor(.grayText))
                Spacer()
                Image.mealzIcon(icon: .caret)
                    .resizable()
                    .renderingMode(.template)
                    .rotationEffect(Angle(degrees: 90))
                    .frame(width: 14, height: 14)
                    .foregroundColor(Color.mealzColor(.primary))
            }
        })
        .padding(Dimension.sharedInstance.lPadding)
        .frame(maxWidth: .infinity)
    }
}
