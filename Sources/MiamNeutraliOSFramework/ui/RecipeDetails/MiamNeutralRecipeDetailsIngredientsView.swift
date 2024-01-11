//
//  MiamNeutralRecipeDetailsIngredientsView.swift
//
//
//  Created by didi on 7/6/23.
//
//import SwiftUI
//import MiamIOSFramework
//import miamCore
//
//@available(iOS 14.0, *)
//public struct MiamNeutralRecipeDetailsIngredientsView: RecipeDetailsIngredientsProtocol {
//    
//    public init() {}
//    
//    public func content(
//        infos: RecipeDetailsIngredientsParameters,
//        onUpdateGuests: @escaping (Int) -> Void
//    ) -> some View {
//        HStack {
//            HStack {
//                // TODO: RecipeDetails localize
//                Text("\(infos.ingredients.count) ingrédients")
//                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
//                    .foregroundColor(Color.black)
//                Spacer()
//            }.padding(.horizontal, Dimension.sharedInstance.lPadding)
//        }
//        Divider()
//            .background(Color.mealzColor(.border))
//            .padding(.horizontal, Dimension.sharedInstance.lPadding)
//        // Ingredients ListView
//        VStack {
//            VStack {
//                ForEach(infos.ingredients, id: \.self) { ingredient in
//                    if let attributes = ingredient.attributes {
//                        let quantity = quantityForIngredient(
//                            ingredient,
//                            currentNumberOfGuests: infos.currentGuests,
//                            recipeNumberOfGuests: infos.recipeGuests)
//                        let formattedQuantity = formatQuantity(
//                            quantity: quantity,
//                            unit: attributes.unit)
//                        MiamNeutralRecipeDetailsIngredientRow(
//                            ingredientName: attributes.name ?? "",
//                            quantity: formattedQuantity)
//                    }
//                }
//            }
//            .padding(.vertical, Dimension.sharedInstance.lPadding)
//        }
//        .background(Color.mealzColor(.lightBackground)).cornerRadius(15.0)
//        .padding( .horizontal,Dimension.sharedInstance.lPadding)
//    }
//    
//    func formatQuantity(quantity: Float, unit: String?) -> String {
//        return QuantityFormatter.default().readableFloatNumber(value: quantity, unit: unit)
//    }
//    
//    func quantityForIngredient(
//        _ ingredient: Ingredient,
//        currentNumberOfGuests: Int,
//        recipeNumberOfGuests: Int
//    ) -> Float {
//        guard let quantity = ingredient.attributes?.quantity else {
//            return 0.0
//        }
//        
//        let realQuantities = QuantityFormatter.default().realQuantities(
//            quantity: quantity,
//            currentGuest: Int32(currentNumberOfGuests),
//            recipeGuest: Int32(recipeNumberOfGuests)
//        )
//        return realQuantities
//    }
//}
//
//@available(iOS 14.0, *)
//struct MiamNeutralRecipeDetailsIngredientsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MiamNeutralRecipeDetailsIngredientsView().content(infos: RecipeDetailsIngredientsParameters(ingredients: [], recipeGuests: 4, currentGuests: 6, guestUpdating: false)) {_ in
//        }
//    }
//}


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
        
        VStack {
            Text("\(infos.ingredients.count) ingrédients").bold().padding(.horizontal).frame(maxWidth: .infinity, alignment: .leading)
            
            GridStack(rows: Int(ceil(Double(infos.ingredients.count) / 3)), columns: 3) { row, col in
                if row*3 + col < infos.ingredients.count {
                    IngrediantCard(guestCount: infos.currentGuests, ingredient: infos.ingredients[row*3 + col])
                }else{
                    Color.clear
                }
            }
        }
        
        /*HStack {
            HStack {
                // TODO: RecipeDetails localize
                Text("\(infos.ingredients.count) ingrédients")
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                    .foregroundColor(Color.black)
                Spacer()
            }.padding(.horizontal, Dimension.sharedInstance.lPadding)
        }
        Divider()
            .background(Color.mealzColor(.border))
            .padding(.horizontal, Dimension.sharedInstance.lPadding)
        // Ingredients ListView
        VStack {
            VStack {
                ForEach(infos.ingredients, id: \.self) { ingredient in
                    if let attributes = ingredient.attributes {
                        let quantity = quantityForIngredient(
                            ingredient,
                            currentNumberOfGuests: infos.currentGuests,
                            recipeNumberOfGuests: infos.recipeGuests)
                        let formattedQuantity = formatQuantity(
                            quantity: quantity,
                            unit: attributes.unit)
                        MiamNeutralRecipeDetailsIngredientRow(
                            ingredientName: attributes.name ?? "",
                            quantity: formattedQuantity)
                    }
                }
            }
            .padding(.vertical, Dimension.sharedInstance.lPadding)
        }
        .background(Color.mealzColor(.lightBackground)).cornerRadius(15.0)
        .padding( .horizontal,Dimension.sharedInstance.lPadding)*/
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
    //var guestCount: Binding<Int>
    var guestCount: Int
    var recipeGuestCount: Int = 4

    var imageURL: URL?
    var title : String
    var quantity: String

    

    /*init(image: Image, title: String, quantity: String) {
        self.image = image
        self.title = title
        self.quantity = quantity
    }*/

    init(guestCount: Int, ingredient: Ingredient) {
        self.guestCount = guestCount

        self.imageURL = URL(string: ingredient.attributes?.pictureUrl ?? "")
        //= Image(uiImage: UIImage(data: try! Data(contentsOf:URL(string: ingredient.attributes?.pictureUrl ?? "")!))!)
        self.title = ingredient.attributes?.name ?? ""

        var qt = (( Float(ingredient.attributes?.quantity ?? "")! * Float(guestCount) )/Float(recipeGuestCount))

        self.quantity = "\(String(format: "%g", qt)) \(ingredient.attributes?.unit ?? "")"
    }

    var body: some View {
        VStack(alignment: .center){
            if let imageURL {
                AsyncImage(url: imageURL, contentProvider: {image in
                    image.resizable().padding(8).frame(width: 56, height: 56)
                }).background(Circle().stroke(Color.miamColor(.backgroundSecondary)))
            }else {
                Image.miamImage(icon: .empty).resizable().padding(8).frame(width: 56, height: 56).background(Circle().stroke(Color.miamColor(.backgroundSecondary)))
            }
            Text(self.title).bold()
            Text(self.quantity).frame(maxWidth: .infinity, alignment: .center)

        }.frame(maxWidth: .infinity, alignment:.top)
    }

    func formatQuantity(quantity: Float, unit: String?) -> String {
        return QuantityFormatter.default().readableFloatNumber(value: quantity, unit: unit)
    }
}
