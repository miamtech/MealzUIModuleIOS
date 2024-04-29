//
//  EmptyButtonView.swift
//
//
//  Created by miam x didi on 23/04/2024.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct EmptyButtonView: BaseButtonProtocol {
    public init() {}
    public func content(params: BaseButtonParameters) -> some View {
        EmptyView()
    }
}
