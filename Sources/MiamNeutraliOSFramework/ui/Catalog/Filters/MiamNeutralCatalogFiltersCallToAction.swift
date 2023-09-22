//
//  SwiftUIView.swift
//  
//
//  Created by didi on 07/08/2023.
//
import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MiamNeutralCatalogFiltersCallToAction: CatalogFiltersCallToActionViewTemplate {
    public init() {}
    public func content(
        numberOfRecipes: Int,
        apply: @escaping () -> Void,
        clear: @escaping () -> Void
    ) -> some View {
        VStack {
            Button {
                clear()
            } label: {
                Text(Localization.catalog.removeFilters.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(Color.miamColor(.primaryText))
            }.padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
            Divider().padding([.bottom, .top], 10)
            Button {
                apply()
            } label: {
                Text("Voir les \(numberOfRecipes) idées repas")
                    .padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                    .foregroundColor(.white)
                    .background(Color.miamColor(.primary))
                    .clipShape(Capsule())
            }
        }
    }
}

@available(iOS 14, *)
struct MiamNeutralCatalogFiltersCallToAction_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralCatalogFiltersCallToAction().content(numberOfRecipes: 8, apply: {}, clear: {})
    }
}
