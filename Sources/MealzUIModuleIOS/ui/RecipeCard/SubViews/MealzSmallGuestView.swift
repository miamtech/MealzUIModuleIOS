//
//  MealzSmallGuestView.swift
//
//
//  Created by Diarmuid McGonagle on 12/01/2024.
//

import Foundation
import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzSmallGuestView: View {
    let guests: Int
    public init(guests: Int) {
        self.guests = guests
    }
    public var body: some View {
        HStack(spacing: 2) {
            Text(String(guests))
                .foregroundColor(Color.mealzColor(.darkestGray))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
            Image.mealzIcon(icon: .user)
                .renderingMode(.template)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(Color.mealzColor(.darkestGray))
        }
        .padding(.horizontal, Dimension.sharedInstance.mPadding)
        .padding(.vertical, Dimension.sharedInstance.sPadding)
        .background(Color.mealzColor(.white))
        .cornerRadius(50)
    }
}
