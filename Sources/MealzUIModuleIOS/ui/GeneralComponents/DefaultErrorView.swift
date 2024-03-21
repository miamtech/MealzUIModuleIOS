//
//  SwiftUIView.swift
//  
//
//  Created by Miam on 19/10/2023.
//

import SwiftUI
import MealzIOSFramework
import mealzcore

@available(iOS 14.0, *)
public struct DefaultErrorView: ErrorProtocol {
  
    public func content(params: BaseErrorParameters) -> some View {
        return VStack {
            Text(Localisation.Error.shared.generic.localised).foregroundColor(Color.mealzColor(.danger))
            Button {
                params.onOptionalCallback?()
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
        DefaultErrorView().content(params: BaseErrorParameters(onOptionalCallback: nil))
    }
}
