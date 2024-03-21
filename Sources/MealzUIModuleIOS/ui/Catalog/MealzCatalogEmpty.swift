//
//  MealzCatalogEmpty.swift
//  
//
//  Created by didi on 08/08/2023.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzCatalogEmpty: EmptyProtocol {
    public init() {}
    public func content(params: BaseEmptyParameters) -> some View {
        Text("No Results were returned")
    }
}

@available(iOS 14, *)
struct MealzCatalogEmpty_Previews: PreviewProvider {
    static var previews: some View {
        MealzCatalogEmpty().content(params: BaseEmptyParameters())
    }
}
