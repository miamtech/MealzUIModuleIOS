//
//  MealzMyMealsTitle.swift
//
//
//  Created by Diarmuid McGonagle on 01/02/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzMyMealsTitle: BaseTitleProtocol {
    public init() {}
    public func content(params: TitleParameters) -> some View {
        EmptyView()
    }
}

@available(iOS 14, *)
struct MealzMyMealsTitle_Previews: PreviewProvider {
    static var previews: some View {
        MealzMyMealsTitle().content(params: TitleParameters(title: "Test", subtitle: "Subtitle"))
    }
}
