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
        var chevronAngle: CGFloat {
            if params.buttonPressed { return 180.0}
            else { return 270.0 }
        }
        
        return Button(action: {
            withAnimation { params.onButtonAction() }
        }, label: {
            HStack {
                Text(params.buttonText)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(Color.mealzColor(.standardDarkText))
                Spacer()
                Image.mealzIcon(icon: .caret)
                    .resizable()
                    .renderingMode(.template)
                    .rotationEffect(Angle(degrees: 90))
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color.mealzColor(.grayText))
                    .rotationEffect(Angle.degrees(chevronAngle))
            }
        })
        .padding(Dimension.sharedInstance.lPadding)
        .frame(maxWidth: .infinity)
    }
}
