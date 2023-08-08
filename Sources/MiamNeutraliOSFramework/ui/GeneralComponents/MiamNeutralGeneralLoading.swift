//
//  MiamNeutralGeneralLoading.swift
//  
//
//  Created by didi on 08/08/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralGeneralLoading: GeneralLoadingViewTemplate {
    public init() {}
    public func content() -> some View {
        ProgressLoader(color: Color.miamColor(.primary))
    }
}

@available(iOS 14, *)
struct MiamNeutralGeneralLoading_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralGeneralLoading().content()
    }
}
