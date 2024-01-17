//
//  DefaultBackgroundView.swift
//
//
//  Created by didi on 09/08/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct DefaultBackgroundView: BackgroundProtocol {
    public init() {}
    public func content() -> some View {
        HStack {}
    }
}

@available(iOS 14, *)
struct DefaultBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultBackgroundView().content()
    }
}
