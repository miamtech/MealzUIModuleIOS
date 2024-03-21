//
//  MealzAddTagView.swift
//  
//
//  Created by didi on 13/10/2023.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzAddTagView: View {
    public let onTapped: () -> Void
    
    public init(onTapped: @escaping () -> Void) {
        self.onTapped = onTapped
    }
    
    public var body: some View {
        Text(Localization.preferences.addTag.localised)
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
            .padding(14.0)
            .frame(height: 40.0)
            .foregroundColor(Color.mealzColor(.darkestGray))
            .background(Color.mealzColor(.white))
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.mealzColor(.border), lineWidth: 1.0))
            .onTapGesture {
                onTapped()
            }
    }
}

@available(iOS 14, *)
struct MealzAddTagView_Previews: PreviewProvider {
    static var previews: some View {
        MealzAddTagView {
            
        }
    }
}
