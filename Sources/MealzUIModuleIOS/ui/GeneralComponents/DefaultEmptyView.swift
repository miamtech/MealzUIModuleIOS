//
//  DefaultEmptyView.swift
//
//
//  Created by didi on 08/08/2023.
//
import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct DefaultEmptyView: EmptyProtocol {
    public init() {}
    public func content(onOptionalCallback: (() -> Void)?) -> some View {
        HStack {}
    }
}

@available(iOS 14, *)
struct DefaultEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultEmptyView().content(onOptionalCallback: nil)
    }
}
