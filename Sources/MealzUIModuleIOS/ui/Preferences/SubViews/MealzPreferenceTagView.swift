//
//  MealzPreferenceTagView.swift
//  
//
//  Created by didi on 13/10/2023.
//

import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzPreferenceTagView: View {
    public let tag: CheckableTag
    public let onToggleTag: (CheckableTag) -> Void
    public var tagName: String {
        get {
            if let name = tag.tag.attributes?.name {
                return name
            }
            return ""
        }
    }
    
    public var backgroundColor: Color {
        get {
            if tag.isChecked {
                return Color.mealzColor(.darkestGray)
            } else {
                return Color.mealzColor(.white)
            }
        }
    }
    
    public var foregroundColor: Color {
        get {
            if tag.isChecked {
                return Color.mealzColor(.white)
            } else {
                return Color.mealzColor(.darkestGray)
            }
        }
    }
    
    public init(tag: CheckableTag, onToggleTag: @escaping (CheckableTag) -> Void) {
        self.tag = tag
        self.onToggleTag = onToggleTag
    }
    
    public var body: some View {
        Text(tagName)
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
            .padding(14.0)
            .frame(height: 40.0)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.mealzColor(.border), lineWidth: 1.0))
            .onTapGesture {
                onToggleTag(tag)
            }
    }
}
