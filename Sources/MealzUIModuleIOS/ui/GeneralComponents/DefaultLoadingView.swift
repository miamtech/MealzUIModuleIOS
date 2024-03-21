//
//  DefaultLoadingView.swift
//
//
//  Created by didi on 09/08/2023.
//
import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct DefaultLoadingView: LoadingProtocol {
    private let size: CGFloat
    public init(size: CGFloat = 60) {
        self.size = size
    }
    public func content(params: BaseLoadingParameters) -> some View {
        ProgressLoader(
            color: Color.mealzColor(.primary),
            size: size
        )
    }
}

@available(iOS 14, *)
struct DefaultLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultLoadingView().content(params: BaseLoadingParameters())
    }
}
