//
//  MiamNeutralRecipeDetailsHeaderView.swift
//
//
//  Created by didi on 3/8/23.
//


import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsHeaderView: RecipeDetailsHeaderProtocol {
    
    public init() {}
    let imageHeight:CGFloat = 400
    public func content(
        infos: RecipeDetailsHeaderParameters,
        onRecipeDetailsClosed: @escaping () -> Void,
        onUpdateGuests: @escaping(Int) -> Void
    ) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Button {
                    onRecipeDetailsClosed()
                } label: {
                    Image.miamImage(icon: .back).renderingMode(.template)
                }.frame(width: 40, height: 40)
                    .foregroundColor(Color.miamColor(.primaryText))
                    .background(Color.white)
                    .clipShape(Circle()).padding()
                Spacer()
                
                LikeButton(likeButtonInfo: LikeButtonInfo(recipeId: infos.recipeId)).padding(16)
            }
            Spacer()
            HStack{
                Spacer()
                HStack{
                    Button {
                        onUpdateGuests(max((infos.currentGuests - 1), 1))
                    } label: {
                        Image.miamImage(icon: .minus)
                            .renderingMode(.template).foregroundColor(.black)
                    }
                    Text("\(infos.currentGuests)").frame(minWidth: 10, alignment: .center)
                    
                    Image.miamImage(icon: .people).renderingMode(.template).foregroundColor(.black)
                    Button {
                        onUpdateGuests(infos.currentGuests + 1)
                    } label: {
                        Image.miamImage(icon: .plus)
                            .renderingMode(.template).foregroundColor(.black)
                    }
                }.padding(8).background(Capsule().foregroundColor(Color.white))
                    .padding(16)
            }
        }
        .background(
            (
                (infos.mediaURL != nil) ?
                AnyView(AsyncImage(url: URL(string: infos.mediaURL!)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }) : AnyView(Image.miamImage(icon: .empty))
            )
            .frame(height: imageHeight), alignment: .top)
        .frame(maxWidth: .infinity)
        .frame(height: imageHeight)
    }
}
