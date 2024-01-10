//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 02/01/2024.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsSelectedControlView: 
    RecipeDetailsSelectedControlProtocol {
   
    var titles: [String] = ["Je fais mes courses", "Je cuisine"]
    @SwiftUI.State private var frames = Array<CGRect>(repeating: .zero, count: 4)
    
    public init() {}
    
    public func content(selection: Binding<Int>) -> some View {
        HStack(spacing: 0) {
                    ForEach(titles.indices, id:\.self) { index in
                        ZStack {
                            Rectangle()
                                .fill(Color.miamColor(.backgroundSecondary))
                            Rectangle()
                                .fill(Color.miamColor(.primary))
                                .cornerRadius(25)
                                .padding(2)
                                .opacity(selection.wrappedValue == index ? 1 : 0.01)
                                .onTapGesture {
                                        withAnimation(.interactiveSpring()) {
                                            selection.wrappedValue = index
                                        }
                                    }
                        }
                        .overlay(
                            Text(titles[index]).lineLimit(1)
                                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigStyle)
                                .foregroundColor((selection.wrappedValue == index) ? .white : .black)
                                
                        )
                    }
                }
                .frame(height: 50)
                .cornerRadius(25)
    }
}
