//
//  MealzGeneralLoading.swift
//  
//
//  Created by didi on 08/08/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzGeneralLoading: LoadingProtocol {
    public init() {}
    public func content() -> some View {
        ProgressLoader(color: Color.mealzColor(.primary))
    }
}

@available(iOS 14, *)
struct MealzGeneralLoading_Previews: PreviewProvider {
    static var previews: some View {
        MealzGeneralLoading().content()
    }
}
