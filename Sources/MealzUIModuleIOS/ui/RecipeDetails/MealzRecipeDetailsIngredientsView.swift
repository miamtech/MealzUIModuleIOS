//
//  MealzRecipeDetailsIngredientsView.swift
//
//
//  Created by didi on 7/6/23.
//
import SwiftUI
import MealzIOSFramework
import mealzcore

@available(iOS 14.0, *)
public struct MealzRecipeDetailsIngredientsView: RecipeDetailsIngredientsProtocol {
    
    public init() {}
    
    public func content(
        params: RecipeDetailsIngredientsParameters
    ) -> some View {
        
        VStack(alignment: .leading) {
            Text(
                String(format: String.localizedStringWithFormat(
                    Localization.recipe.numberOfIngredients(
                        numberOfIngredients: Int32(params.ingredients.count)).localised,
                    params.ingredients.count),
                       params.ingredients.count)
            )
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            .padding()
            GridStack(rows: Int(ceil(Double(params.ingredients.count) / 3)), columns: 3) { row, col in
                let index = row * 3 + col
                if index < params.ingredients.count {
                    IngrediantCard(
                        guestCount: params.currentGuests,
                        defaultRecipeCount: params.recipeGuests,
                        ingredient: params.ingredients[index]
                    )
                } else { Color.clear }
            }
        }
    }
}

@available(iOS 14.0, *)
struct MealzRecipeDetailsIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        MealzRecipeDetailsIngredientsView().content(
            params: RecipeDetailsIngredientsParameters(
                ingredients: [], recipeGuests: 4, currentGuests: 6))
    }
}

@available(iOS 14, *)
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack(alignment: .top) {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column).frame(maxWidth: .infinity)
                    }
                }.frame(alignment:.leading)
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

@available(iOS 14, *)
struct IngrediantCard: View {
    var imageURL: URL?
    var title : String
    var quantity: String
    
    init(guestCount: Int, defaultRecipeCount: Int, ingredient: Ingredient) {
        self.imageURL = URL(string: ingredient.attributes?.pictureUrl ?? "")
        self.title = ingredient.attributes?.name ?? ""
        
        if let quantity = ingredient.attributes?.quantity, let unit = ingredient.attributes?.unit {
            self.quantity = QuantityFormatter.companion.readableFloatNumber(
                value: QuantityFormatter.companion.realQuantities(
                    quantity: quantity,
                    currentGuest: Int32(guestCount),
                    recipeGuest: Int32(defaultRecipeCount)
                ),
                unit: unit
            )
        } else { self.quantity = "" }
    }
    
    var body: some View {
        VStack(alignment: .center){
            if let imageURL {
                AsyncImage(url: imageURL, contentProvider: { image in
                    image
                        .resizable()
                        .padding(8)
                        .frame(width: 56, height: 56)
                }).background(
                    Circle().stroke(Color.mealzColor(.lightBackground)))
            } else {
                Image.mealzIcon(icon: .pan)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.mealzColor(.darkestGray))
                    .padding(8)
                    .frame(width: 56, height: 56)
                    .background(Circle().stroke(Color.mealzColor(.lightBackground)))
            }
            Text(self.title)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.mealzColor(.standardDarkText))
            Text(self.quantity)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.mealzColor(.standardDarkText))
                .frame(maxWidth: .infinity, alignment: .center)
        }.frame(maxWidth: .infinity, alignment:.top)
    }
}
