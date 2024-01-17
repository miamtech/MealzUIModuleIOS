//
//  MealzPreferenceListItemView.swift
//  
//
//  Created by didi on 13/10/2023.
//

import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzPreferenceListItemView: View {
    public let tag: CheckableTag
    public let onToggleTag: (CheckableTag) -> Void
    
    public init(tag: CheckableTag, onToggleTag: @escaping (CheckableTag) -> Void) {
        self.tag = tag
        self.onToggleTag = onToggleTag
    }
    
    var tagName: String {
        get {
            if let name = tag.tag.attributes?.name {
                return name
            }
            return ""
        }
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    onToggleTag(tag)
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(4)
                            .border(Color.mealzColor(.border), width: 1)
                            .frame(width: 20, height: 20, alignment: .center)
                        
                        if tag.isChecked {
                            Image.mealzIcon(icon: .check)
                                .renderingMode(.original).frame( alignment: .center)
                        }
                    }
                }
                .foregroundColor(Color.white)
                Text(tagName)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
            }.padding(Dimension.sharedInstance.lPadding)
            Divider()
        }
    }
}
