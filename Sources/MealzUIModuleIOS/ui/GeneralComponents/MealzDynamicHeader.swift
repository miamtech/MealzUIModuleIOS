//
//  MiamDynamicHeader.swift
//  MealzIOSFramework
//
//  Created by didi on 5/16/23.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI

@available(iOS 14, *)
struct MealzDynamicHeader<ExpandedHeader: View, CollapsedHeader: View, Content: View>: View {
    var safeArea: EdgeInsets
    let expandedHeader: () -> ExpandedHeader
    let collapsedHeader: () -> CollapsedHeader
    let content: () -> Content
    @State var expandedFormSize: CGSize = .zero
    init(safeArea: EdgeInsets,
         @ViewBuilder expandedHeader: @escaping () -> ExpandedHeader,
         @ViewBuilder collapsedHeader: @escaping () -> CollapsedHeader,
         @ViewBuilder content: @escaping () -> Content
    ) {
            self.safeArea = safeArea
            self.expandedHeader = expandedHeader
            self.collapsedHeader = collapsedHeader
            self.content = content
        }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ZStack {
                    expandedHeader()
                        .saveSize(in: $expandedFormSize)
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                        if minY < (-expandedFormSize.height / 2) {
                                withAnimation {
                                    ZStack {
                                        Color.white
                                        collapsedHeader()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .offset(y: minY < 50 ? -(minY) : 0)
                                }
                            }
                    }
                        .frame(height: 65)
                }
                    .zIndex(1)
                content()
                    .padding(.top, 20)
                    .zIndex(0)
            }
        }
        .coordinateSpace(name: "SCROLL")
    }
}

@available(iOS 14.0, *)
struct MealzDynamicHeader_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            MealzDynamicHeader(
                safeArea: safeArea,
                expandedHeader: {
                    Text("Expanded")
                    .padding(50)
                    .background(Color.red)
                },
                collapsedHeader: {Text("Collapsed")},
                content: {
                    ForEach(1..<21) { _ in
                            Text("hello world")
                    }
                }
            )
        }
    }
}
