//
//  MealzFiltersCTA.swift
//  
//
//  Created by didi on 07/08/2023.
//
import SwiftUI
import MealzIOSFramework
import mealzcore

@available(iOS 14, *)
public struct MealzFiltersCTA: FiltersCTAProtocol {
    public init() {}
    public func content(params: FiltersCTAParameters) -> some View {
        VStack {
            Button {
                params.onClear()
            } label: {
                Text(Localization.catalog.removeFilters.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(Color.mealzColor(.primaryText))
            }.padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
            Divider().padding([.bottom, .top], 10)
            Button {
                params.onApply()
            } label: {
                Text("Voir les \(params.numberOfRecipes) idées repas")
                    .padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(.white)
                    .background(Color.mealzColor(.primary))
                    .clipShape(Capsule())
            }
        }
    }
}

@available(iOS 14, *)
struct MealzFiltersCTA_Previews: PreviewProvider {
    static var previews: some View {
        MealzFiltersCTA().content(params: FiltersCTAParameters(numberOfRecipes: 8, onApply: {}, onClear: {}))
    }
}
