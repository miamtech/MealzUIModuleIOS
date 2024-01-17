//
//  SwiftUIView.swift
//  
//
//  Created by Miam on 19/10/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14.0, *)
public struct DefaultErrorView: ErrorProtocol {
  
    public func content(onOptionalCallback: (() -> Void)?) -> some View {
        return VStack {
            Text(Localisation.Error.shared.generic.localised).foregroundColor(Color.mealzColor(.danger))
            Button {
                onOptionalCallback?()
            } label: {
                Text(Localisation.Error.shared.retry.localised)
                    .foregroundColor(.blue)
                    .padding()
            }
        }
    }
}

@available(iOS 14, *)
struct DefaultErrorView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultErrorView().content(onOptionalCallback: nil)
    }
}
