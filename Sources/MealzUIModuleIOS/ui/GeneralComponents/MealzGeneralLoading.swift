//
//  MealzGeneralLoading.swift
//  
//
//  Created by didi on 08/08/2023.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzGeneralLoading: LoadingProtocol {
    public init() {}
    public func content(params: BaseLoadingParameters) -> some View {
        ProgressLoader(color: Color.mealzColor(.primary))
    }
}

@available(iOS 14, *)
public struct MealzGeneralComponentLoading: LoadingProtocol {
    public init() {}
    public func content(params: BaseLoadingParameters) -> some View {
        EmptyView()
    }
}

@available(iOS 14, *)
struct MealzGeneralLoading_Previews: PreviewProvider {
    static var previews: some View {
        MealzGeneralLoading().content(params: BaseLoadingParameters())
    }
}
