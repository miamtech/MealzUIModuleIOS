//
//  DefaultEmptyView.swift
//
//
//  Created by didi on 08/08/2023.
//
import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct DefaultEmptyView: EmptyProtocol {
    public init() {}
    public func content(params: BaseEmptyParameters) -> some View {
        HStack {}
    }
}
