//
//  MealzBasketTagItem.swift
//  
//
//  Created by didi on 25/10/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzBasketTagItem: BaseTitleProtocol {
    public init() {}
    public func content(
        title: String,
        subtitle: String?
    ) -> some View {
        VStack {
            Text(title)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                .padding(Dimension.sharedInstance.mlPadding)
                .frame(maxWidth: 150, alignment: .leading)
                .frame(height: 20)
                .lineLimit(1) // Limit the text to one line
                .truncationMode(.tail)
        }
        .background(
               RoundedRectangle(cornerRadius: 10)
                   .stroke(Color.gray, lineWidth: 1)
           )
    }
}

@available(iOS 14, *)
struct MealzBasketTagItem_Previews: PreviewProvider {
    static var previews: some View {
        MealzBasketTagItem().content(title: "Test", subtitle: nil)
    }
}
