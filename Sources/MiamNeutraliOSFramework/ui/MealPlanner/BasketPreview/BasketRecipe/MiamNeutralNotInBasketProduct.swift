//
//  MiamNeutralNotInBasketProduct.swift
//
//
//  Created by didi on 02/10/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MiamNeutralNotInBasketProduct: NotInBasketProductProtocol {
    public init() {}
    public func content(item: BasketEntry, onAddToBasket: (() -> Void)?) -> some View {
        HStack {
            Text(item.name.capitalizingFirstLetter())
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
                .foregroundColor(Color.mealzColor(.darkGray))
            Spacer()
            if let addIngredientAction = onAddToBasket {
                Button(action: addIngredientAction) {
                    Image.mealzIcon(icon: .plus)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(Color.mealzColor(.primary))
                    Text(Localization.basket.addProduct.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                        .foregroundColor(Color.mealzColor(.primary))
                }
            }
        }
        .padding(.horizontal, Dimension.sharedInstance.lPadding)
        .padding(.bottom, Dimension.sharedInstance.lPadding)
    }
}
