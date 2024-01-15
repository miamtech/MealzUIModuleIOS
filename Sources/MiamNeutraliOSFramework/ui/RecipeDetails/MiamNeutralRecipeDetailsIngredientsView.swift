//
//  MiamNeutralRecipeDetailsIngredientsView.swift
//
//
//  Created by didi on 7/6/23.
//
import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14.0, *)
public struct MiamNeutralRecipeDetailsIngredientsView: RecipeDetailsIngredientsProtocol {
    
    public init() {}
    
    public func content(
        infos: RecipeDetailsIngredientsParameters,
        onUpdateGuests: @escaping (Int) -> Void
    ) -> some View {
        
        VStack(alignment: .leading) {
            Text(
                String(format: String.localizedStringWithFormat(
                    Localization.recipe.numberOfIngredients(
                        numberOfIngredients: Int32(infos.ingredients.count)).localised,
                    infos.ingredients.count),
                       infos.ingredients.count)
            )
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            .padding()
            GridStack(rows: Int(ceil(Double(infos.ingredients.count) / 3)), columns: 3) { row, col in
                let index = row * 3 + col
                if index < infos.ingredients.count {
                    IngrediantCard(
                        guestCount: infos.currentGuests,
                        ingredient: infos.ingredients[index]
                    )
                } else { Color.clear }
            }
        }
    }
    
    func formatQuantity(quantity: Float, unit: String?) -> String {
        return QuantityFormatter.default().readableFloatNumber(value: quantity, unit: unit)
    }
    
    func quantityForIngredient(
        _ ingredient: Ingredient,
        currentNumberOfGuests: Int,
        recipeNumberOfGuests: Int
    ) -> Float {
        guard let quantity = ingredient.attributes?.quantity else {
            return 0.0
        }
        
        let realQuantities = QuantityFormatter.default().realQuantities(
            quantity: quantity,
            currentGuest: Int32(currentNumberOfGuests),
            recipeGuest: Int32(recipeNumberOfGuests)
        )
        return realQuantities
    }
}

@available(iOS 14.0, *)
struct MiamNeutralRecipeDetailsIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralRecipeDetailsIngredientsView().content(infos: RecipeDetailsIngredientsParameters(ingredients: [], recipeGuests: 4, currentGuests: 6, guestUpdating: false)) {_ in
        }
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
    var guestCount: Int
    var recipeGuestCount: Int = 4

    var imageURL: URL?
    var title : String
    var quantity: String

    init(guestCount: Int, ingredient: Ingredient) {
        self.guestCount = guestCount

        self.imageURL = URL(string: ingredient.attributes?.pictureUrl ?? "")
        self.title = ingredient.attributes?.name ?? ""

        if let quantity = ingredient.attributes?.quantity, let qty = Float(quantity) {
            self.quantity = "\(String(format: "%g", qty)) \(ingredient.attributes?.unit ?? "")"
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
                    .resizable()
                    .foregroundColor(Color.mealzColor(.standardDarkText))
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

    func formatQuantity(quantity: Float, unit: String?) -> String {
        return QuantityFormatter.default().readableFloatNumber(value: quantity, unit: unit)
    }
}
