//
//  MealzMyProductsProductCard.swift
//
//
//  Created by Antonin Francois on 11/04/2024.
//

import Foundation
import SwiftUI
import mealzcore
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzMyProductsProductCard: MyProductsProductCardProtocol {
    public init() {}
    public func content(params: MyProductsProductCardParameters) -> some View {
        let capacity = (params.entry.selectedItem?.capacityCombined ?? "")
        return VStack(spacing: 0) {
            VStack {
                HStack(alignment: .top, spacing: 12) {
                    if let picture = URL(string: params.entry.selectedItem?.attributes?.image ?? "") {
                        AsyncImage(url: picture) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                        .clipped()
                    } else {
                        Image.mealzIcon(icon: .pan).frame(width: 100, height: 100).cornerRadius(8)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text(params.entry.selectedItem?.attributes?.name ?? "")
                        HStack {
                            IngredientUnitBubble(capacity: capacity)
                            // TODO: add price per unit when merged
                        }
                        ReplaceButton().padding(.top, 4)
                        Spacer()
                    }
                    Spacer()
                }
                HStack {
                    if let unitPrice = params.entry.selectedItem?.attributes?.unitPrice, let price = Double(unitPrice) {
                        Text(price.currencyFormatted)
                            .foregroundColor(Color.mealzColor(.primaryText))
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                    }
                    Spacer()
                    // TODO: add custom view
                    MealzCounterView(count: 0, lightMode: true) { count in
                        // TODO: when VM is done
                    }
                }
            }
            .padding(Dimension.sharedInstance.lPadding)
            Divider()
        }
    }
    
    struct ReplaceButton: View {
        var body: some View {
            Button(action: {
                // TODO: when VM is done
            }) {
                //Text(Localization.myProducts.replace.localised)
                Text("Remplacer")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.mealzColor(.primary))
                    .padding(.vertical, 8)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
