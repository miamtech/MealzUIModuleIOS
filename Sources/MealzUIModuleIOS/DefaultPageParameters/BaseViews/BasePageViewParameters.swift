//
//  BasePageViewParameters.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import Foundation
import MealzIOSFramework
import SwiftUI

@available(iOS 14, *)
public struct BasePageViewParameters: BaseViewsProtocol {
    public var loading: TypeSafeLoading
    public var empty: TypeSafeEmpty
    public var background: TypeSafeBackground
    
    public init(
        loading: TypeSafeLoading = TypeSafeLoading(DefaultLoadingView()),
        empty: TypeSafeEmpty = TypeSafeEmpty(MealzGeneralEmpty()),
        background: TypeSafeBackground = TypeSafeBackground(DefaultBackgroundView())
    ) {
        self.loading = loading
        self.empty = empty
        self.background = background
    }
}
