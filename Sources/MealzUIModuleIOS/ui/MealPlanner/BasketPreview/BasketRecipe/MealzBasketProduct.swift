//
//  MealzBasketProduct.swift
//  
//
//  Created by didi on 02/10/2023.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzBasketProduct: BasketProductProtocol {
    
    public init() {}
    public func content(params: BasketProductParameters) -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: Dimension.sharedInstance.lPadding) {
                AsyncImage(url: params.data.pictureURL) { image in
                    image.resizable()
                }
                .frame(width: 96, height: 96)
                infoAndTitle(
                    name: params.data.name,
                    description: params.data.description,
                    delete: params.onDeleteProduct
                )
            }
            .frame(maxWidth: .infinity)
            HStack {
                priceContent(
                    price: params.data.price,
                    unitPrice: params.data.unitPrice
                )
                Spacer()
                HStack(spacing: 12.0) {
                    changeProductButton(
                        changeProduct: params.onChangeProduct
                    )
                    MealzStepper(value: params.quantity, minValue: 0)
                        .onChange(of: params.quantity.wrappedValue) { qty in
                            params.onQuantityChanged(qty)
                        }
                        .frame(width: 140.0)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    func infoAndTitle(
        name: String,
        description: String,
        delete: @escaping () -> Void
    ) -> some View {
            return HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: Dimension.sharedInstance.sPadding) {
                    Text(name)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
                    Text(description)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                    // TODO: add line with quantity?
                }
                Spacer()
                Button {
                    delete()
                } label: {
                    Image.mealzIcon(icon: .trash)
                        .renderingMode(.template)
                        .foregroundColor(Color.mealzColor(.primaryText))
                }
                .padding(Dimension.sharedInstance.mlPadding)
        }.frame(maxWidth: .infinity)
    }
    
    func priceContent(price: Double, unitPrice: Double) -> some View {
        return  VStack {
            Text(price.currencyFormatted)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                .foregroundColor(Color.mealzColor(.primary))
            Text(formatPricePerUnit(unitPrice: unitPrice, unit: Localization.price.currency.localised))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
        }
    }
    
    func changeProductButton(changeProduct: @escaping () -> Void) -> some View {
        return Button {
            changeProduct()
        } label: {
            HStack {
                Image.mealzIcon(icon: .swap)
                
                Text(Localization.basket.swapProduct.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                    .foregroundColor(Color.mealzColor(.primary))
            }
        }
    }

    func formatPricePerUnit(unitPrice: Double, unit: String) -> String {
        return String(format: "%.2f / %@", unitPrice, unit)
    }
}
