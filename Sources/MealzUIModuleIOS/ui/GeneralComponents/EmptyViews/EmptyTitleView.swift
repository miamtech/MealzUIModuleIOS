//
//  EmptyTitleView.swift
//  MealzIOSFramework
//
//  Created by Antonin Francois on 28/03/2024.
//  Copyright © 2024 Mealz. All rights reserved.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct EmptyTitleView: BaseTitleProtocol {
    public init() {}
    public func content(params: TitleParameters) -> some View {
        EmptyView()
    }
}

@available(iOS 14, *)
struct EmptyTitleView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTitleView().content(params: TitleParameters(title: "Test", subtitle: nil))
    }
}
