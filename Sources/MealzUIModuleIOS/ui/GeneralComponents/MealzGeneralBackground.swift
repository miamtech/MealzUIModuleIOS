//
//  MealzGeneralBackground.swift
//  
//
//  Created by didi on 09/08/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzGeneralBackground: BackgroundProtocol {
    public init() {}
    public func content(params: BaseBackgroundParameters) -> some View {
        HStack {}
    }
}

@available(iOS 14, *)
struct MealzGeneralBackground_Previews: PreviewProvider {
    static var previews: some View {
        MealzGeneralBackground().content(params: BaseBackgroundParameters())
    }
}
