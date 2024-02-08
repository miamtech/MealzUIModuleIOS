//
//  SwiftUIView.swift
//  
//
//  Created by didi on 6/24/23.
//

// can i delete?

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzNoSearchResults: View {
    var message: String
    public var body: some View {
        HStack {
            Image(systemName: "exclamationmark")
                .resizable()
                .foregroundColor(Color.mealzColor(.danger))
                .frame(width: 5, height: 25)
                .padding(.trailing, Dimension.sharedInstance.lPadding)
            Text(message)
//                .coursesUFontStyle(style: CoursesUFontStyleProvider().bodyBigStyle)
        }
        .padding(.vertical, Dimension.sharedInstance.lPadding)
        .padding(.horizontal, Dimension.sharedInstance.xlPadding)
        .background(Color.mealzColor(.primary))
        .cornerRadius(Dimension.sharedInstance.mCornerRadius)
    }
}
