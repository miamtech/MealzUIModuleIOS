//
//  MealzBasketTagItemLoading.swift
//  
//
//  Created by didi on 25/10/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzBasketTagItemLoading: LoadingProtocol {
    public init() {}
    public func content() -> some View {
       EmptyView()
    }
}

@available(iOS 14, *)
struct MealzBasketTagItemLoading_Previews: PreviewProvider {
    static var previews: some View {
        MealzBasketTagItemLoading().content()
    }
}
