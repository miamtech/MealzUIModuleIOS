//
//  MealzRecipeDetailsTagsView.swift
//
//
//  Created by Damien Walerowicz on 03/01/2024.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzRecipeDetailsTagsView: View {
    private let tags: [RecipeDetailTags]
    
    public init(tags: [RecipeDetailTags]) {
        self.tags = tags
    }
    public var body: some View {
        WrappedHStack {
            EmptyView()
            ForEach(tags, id: \.id) { tag in
                TagItem {
                    HStack{
                        Image.mealzIcon(icon: tag.picto)
                            .renderingMode(.template)
                            .foregroundColor(Color.mealzColor(.standardDarkText))
                        Text(tag.text)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                            .foregroundColor(Color.mealzColor(.standardDarkText))
                    }
                }
            }
        } plus: {
            AnyView(Text("...").padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .background(Capsule().fill(Color.mealzColor(.lightBackground))))
        }.frame(maxWidth: .infinity)
    }
}

/**
 A class use to add capsule background of each tags
*/

@available(iOS 14, *)
struct TagItem <Content> : View where Content: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)).miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
            .background(Capsule().fill(Color.mealzColor(.lightBackground)))
    }
}

/**
 A class used to access all subview of a view   */

@available(iOS 13, *)
extension TupleView {
    public var getViews: [AnyView] {
        makeArray(from: value)
    }
    
    private struct GenericView {
        let body: Any
        
        var anyView: AnyView? {
            AnyView(_fromValue: body)
        }
    }
    
    private func makeArray<Tuple>(from tuple: Tuple) -> [AnyView] {
        func convert(child: Mirror.Child) -> AnyView? {
            withUnsafeBytes(of: child.value) { ptr -> AnyView? in
                let binded = ptr.bindMemory(to: GenericView.self)
                return binded.first?.anyView
            }
        }
        
        let tupleMirror = Mirror(reflecting: tuple)
        return tupleMirror.children.compactMap(convert)
    }
}

@available(iOS 14, *)
class Manager {
    var lines = Array<Array<AnyView>>()
    var content = [AnyView]()
    var plusView : AnyView?
}

/**
 A class implementing the a wrapping list of View
 if expend is false,only one line is draw with a button '...' to expend.
 If expend is true, all elements are drawn with line break
  */

@available(iOS 14, *)
struct WrappedHStack: View {
    @SwiftUI.State var frame: CGSize = .zero
    
    @inline(__always) private static func getWidth<V: View>(of view: V) -> Double {
        let hostingController = UIHostingController(rootView: view)
        return hostingController.sizeThatFits(in: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)).width
        
    }
    var manager = Manager()
    
    @SwiftUI.State var expend = false
    
    init<Views>(@ViewBuilder content: @escaping () -> TupleView<Views>, @ViewBuilder plus: @escaping () -> AnyView) {
        manager.content = content().getViews
        manager.plusView = plus()
        var width = CGFloat.zero
        manager.lines.append(Array<AnyView>())
        var index = 0
        
        manager.content.forEach { v in
            if width + WrappedHStack.getWidth(of: v.fixedSize()) > UIScreen.main.bounds.size.width {
                width = 0
                manager.lines.append(Array<AnyView>())
                index += 1
            }
            manager.lines[index].append(v)
            width += WrappedHStack.getWidth(of: v)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<manager.lines.count, id: \.self) { l in
                HStack(alignment: .top){
                    ForEach(0..<manager.lines[l].count,  id: \.self) { index in
                        if( expend == true || (expend == false && l == 0 )) {
                            if(expend == false && l == 0 && manager.lines.count > 1 && index == manager.lines[0].count - 1) {
                                manager.plusView.onTapGesture {
                                    self.expend.toggle()
                                }
                            }else{
                                manager.lines[l][index]
                            }
                        }
                    }
                }
            }
            
        }
    }
}
