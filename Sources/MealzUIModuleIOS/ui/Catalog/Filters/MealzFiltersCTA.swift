//
//  MealzFiltersCTA.swift
//  
//
//  Created by didi on 07/08/2023.
//
import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzFiltersCTA: FiltersCTAProtocol {
    public init() {}
    public func content(
        numberOfRecipes: Int,
        onApply: @escaping () -> Void,
        onClear: @escaping () -> Void
    ) -> some View {
        VStack {
            Button {
                onClear()
            } label: {
                Text(Localization.catalog.removeFilters.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(Color.mealzColor(.primaryText))
            }.padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
            Divider().padding([.bottom, .top], 10)
            Button {
                onApply()
            } label: {
                Text("Voir les \(numberOfRecipes) idées repas")
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
        MealzFiltersCTA().content(numberOfRecipes: 8, onApply: {}, onClear: {})
    }
}
