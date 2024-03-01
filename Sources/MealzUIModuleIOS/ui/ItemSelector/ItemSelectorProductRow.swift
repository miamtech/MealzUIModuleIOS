//
//  ItemSelectorProductRow.swift
//
//
//  Created by Miam on 04/10/2023.
//

import Foundation
import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
struct ItemSelectorProductRow: View {
    
    private var isSelected: Bool
    private var product: Item
    private var onSelectProduct: ((Item) -> Void)?
    
    init(product: Item, isSelected: Bool = false, onSelectProduct: ((Item) -> Void)? = nil) {
        self.isSelected = isSelected
        self.product = product
        self.onSelectProduct = onSelectProduct
    }
    
    var body: some View {
        let capacity = (product.attributes?.capacityVolume ?? "") + " " + (product.attributes?.capacityUnit ?? "")
        return VStack(spacing: 0) {
            VStack {
                HStack {
                    if let picture = URL(string: product.attributes?.image ?? "") {
                        AsyncImage(url: picture) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(width: 90, height: 90)
                        .clipped()
                    } else {
                        Image.mealzIcon(icon: .pan).frame(width: 90, height: 90)
                    }
                    VStack(alignment: .leading) {
                        Text(product.attributes?.brand ?? "" )
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallBoldStyle)
                            .padding(.bottom, 8)
                        Text(product.attributes?.name ??  "")
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallBoldStyle)
                        IngredientUnitBubble(capacity: capacity)
                        Spacer()
                    }.padding(16)
                    Spacer()
                }
                HStack {
                    if let unitPrice = product.attributes?.unitPrice, let price = Double(unitPrice) {
                        Text(price.currencyFormatted)
                            .foregroundColor(Color.mealzColor(.primaryText))
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                    }
                    Spacer()
                    Button(action: {
                        if let onSelectProduct {
                            onSelectProduct(product)
                        }
                    }, label: {
                        Text(isSelected ? Localization.itemSelector.inBasket.localised : Localization.itemSelector.select.localised )
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 9)
                            .foregroundColor(isSelected ? Color.mealzColor(.grayText) : Color.mealzColor(.white))
                            .background( isSelected ? Color.mealzColor(.lightBackground) : Color.mealzColor(.primary))
                            .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
                    })
                }
            }
            .padding([.horizontal, .bottom], Dimension.sharedInstance.lPadding)
            .background(
                isSelected ? Color.mealzColor(.itemSelectedBackground) : Color.clear
            )
            Divider()
        }
    }
}
