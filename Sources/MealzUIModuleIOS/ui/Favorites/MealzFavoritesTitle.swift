//
//  MealzFavoritesTitle.swift
//
//
//  Created by Diarmuid McGonagle on 29/01/2024.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzFavoritesTitle: BaseTitleProtocol {
    public init() {}
    public func content(params: TitleParameters) -> some View {
        EmptyView()
    }
}

@available(iOS 14, *)
struct MealzFavoritesTitle_Previews: PreviewProvider {
    static var previews: some View {
        MealzFavoritesTitle().content(params: TitleParameters(title: "Test", subtitle: "Subtitle"))
    }
}
