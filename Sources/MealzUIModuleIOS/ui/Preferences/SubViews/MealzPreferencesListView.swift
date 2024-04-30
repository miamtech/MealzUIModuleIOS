//
//  MealzPreferencesListView.swift
//  
//
//  Created by didi on 13/10/2023.
//

import SwiftUI
import mealzcore
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzPreferencesListView: View {
    let title: String
    let subtitle: String
    let preferences: [CheckableTag]
    let onToggleTag: (CheckableTag) -> Void
    
    public init(
        title: String,
        subtitle: String,
        preferences: [CheckableTag],
        onToggleTag: @escaping (CheckableTag) -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.preferences = preferences
        self.onToggleTag = onToggleTag
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
                .padding([.top, .horizontal], Dimension.sharedInstance.mPadding)
            Text(subtitle)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                .padding([.bottom, .horizontal], Dimension.sharedInstance.mPadding)
            
            VStack(alignment: .leading) {
                ForEach(preferences, id: \.self) { tag in
                    MealzPreferenceListItemView(tag: tag) { tag in
                        onToggleTag(tag)
                    }
                }
            }.background(Color.mealzColor(.white))
                .padding([.bottom], 8.0)
                .cornerRadius(8.0)
                .padding([.bottom], -8.0)
        }
    }
}

@available(iOS 14, *)
struct MealzPreferencesListView_Previews: PreviewProvider {
    static var previews: some View {
        MealzPreferencesListView(
            title: "Vegetarien",
            subtitle: "No Meat",
            preferences: [],
            onToggleTag: { _ in })
    }
}
