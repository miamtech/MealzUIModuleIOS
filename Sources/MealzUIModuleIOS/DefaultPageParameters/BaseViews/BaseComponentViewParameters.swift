//
//  BaseComponentViewParameters.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzIOSFramework
import SwiftUI

@available(iOS 14, *)
public struct BaseComponentViewParameters: BaseViewsProtocol {
    public var loading: TypeSafeLoading
    public var empty: TypeSafeEmpty
    public var background: TypeSafeBackground
    
    public init(
        loading: TypeSafeLoading = TypeSafeLoading(MealzGeneralComponentLoading()),
        empty: TypeSafeEmpty = TypeSafeEmpty(DefaultEmptyView()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.loading = loading
        self.empty = empty
        self.background = background
    }
}
