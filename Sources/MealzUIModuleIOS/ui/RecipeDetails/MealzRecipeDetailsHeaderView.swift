//
//  MealzRecipeDetailsHeaderView.swift
//
//
//  Created by didi on 3/8/23.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzRecipeDetailsHeaderView: RecipeDetailsHeaderProtocol {
    public init() {}
    let imageHeight:CGFloat = 400
    public func content(params: RecipeDetailsHeaderParameters) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Button {
                        params.onRecipeDetailsClosed()
                    } label: {
                        Image.mealzIcon(icon: .caret)
                            .renderingMode(.template)
                            .rotationEffect(Angle(degrees: 180))
                    }.frame(width: 40, height: 40)
                        .foregroundColor(Color.mealzColor(.primary))
                        .background(Color.white)
                        .clipShape(Circle()).padding()
                    Spacer()
                    LikeButton(likeButtonInfo: LikeButtonInfo(recipeId: params.recipeId)).padding(16)
                }
                Spacer()
                HStack{
                    Spacer()
                    HStack{
                        Button {
                            params.onUpdateGuests(max((params.currentGuests - 1), 1))
                        } label: {
                            Image.mealzIcon(icon: .minus)
                                .renderingMode(.template).foregroundColor(.black)
                        }
                        Text("\(params.currentGuests)")
                            .frame(minWidth: 10, alignment: .center)
                            .foregroundColor(Color.mealzColor(.darkestGray))
                        Image.mealzIcon(icon: .guests)
                            .renderingMode(.template)
                            .foregroundColor(Color.mealzColor(.darkestGray))
                        Button {
                            params.onUpdateGuests(params.currentGuests + 1)
                        } label: {
                            Image.mealzIcon(icon: .plus)
                                .renderingMode(.template).foregroundColor(.black)
                        }
                    }.padding(8).background(Capsule().foregroundColor(Color.white))
                        .padding(16)
                }
            }
            .background(
                mediaImageView(mediaURL: params.mediaURL).frame(height: imageHeight),
                alignment: .top)
            .frame(maxWidth: .infinity)
            .frame(height: imageHeight)
            Text(params.title)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                .padding(.bottom, Dimension.sharedInstance.sPadding)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            MealzRecipeDetailsTagsView(tags: params.tags)
        }
    }
    
    @ViewBuilder
    private func mediaImageView(mediaURL: String?) -> some View {
        if let urlString = mediaURL, let url = URL(string: urlString) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        } else {
            Image.mealzIcon(icon: .pan)
        }
    }
    
}
