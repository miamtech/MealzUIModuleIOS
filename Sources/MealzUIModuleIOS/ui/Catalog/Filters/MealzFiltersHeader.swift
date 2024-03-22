//
//  MealzFiltersHeader.swift
//  
//
//  Created by didi on 07/08/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzFiltersHeader: FiltersHeaderProtocol {
    
    public init() {}
    public func content(params: FiltersHeaderParameters) -> some View {
        HStack {
            Text(Localization.catalog.filtersTitle.localised)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
            Spacer()
        }.padding([.top], 20)
    }
}

@available(iOS 14, *)
struct MealzFiltersHeader_Previews: PreviewProvider {
    static var previews: some View {
        MealzFiltersHeader().content(params: FiltersHeaderParameters(onCloseFilters: {}))
    }
}
