//
//  File.swift
//
//
//  Created by Damien Walerowicz on 03/01/2024.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsProductsView :
    RecipeDetailsProductsProtocol {
    
    public init() {}
    
    public func content(
        infos: RecipeDetailsProductsParameters
    ) -> some View {
        VStack {
            ForEach(0..<infos.products.count, id:\.self ) { p in
                HStack {
                    MiamNeutralRecipeDetailsProductView(viewModel: infos.products[p]).padding(.horizontal)
                }
            }
        }
    }
}

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsProductView : View {
    
    @ObservedObject var viewModel: ProductVM
    init(viewModel: ProductVM) {
        self.viewModel = viewModel
    }
    
    func formatQuantity() -> String {
        guard let fvalue = Float(viewModel.ingredient?.attributes?.quantity ?? "0") else { return "" }
        guard let unit = viewModel.ingredient?.attributes?.unit else { return "" }
        return String(format: "%g \(unit)", fvalue)
        
    }
    
    public var body: some View {
        switch viewModel.basketEntry?.attributes?.status {
        case nil :
            EmptyView ()
        case "ignored", "often_deleted", "isIgnored", "deleted":
            VStack {
                HStack {
                    Text(viewModel.ingredient?.name ?? "").padding(8).miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                    Spacer()
                    Text(formatQuantity()).padding(8)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                }.frame(height:40)
                Text("Cet ingrédient ne sera pas ajouté à votre panier").padding(8)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                Button {
                    
                } label: {
                    Text("Choisir un produit").padding(8)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                        .foregroundColor(Color.miamColor(.primary))
                }
            }.background(Color.miamColor(.backgroundSecondary))
            .cornerRadius(8)
        default:
            
            VStack {
                HStack {
                    Text(viewModel.ingredient?.name ?? "").padding(8).miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                    Spacer()
                    Text(formatQuantity()).padding(8)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                }
                .foregroundColor((viewModel.basketEntry?.attributes?.status == "active") ? Color.miamColor(.white) :  Color.miamColor(.black))
                .frame(height:40)
                    .background((viewModel.basketEntry?.attributes?.status == "active") ? Color.miamColor(.primary) :  Color.miamColor(.backgroundSecondary)).cornerRadius(8, corners: .top)
                
                HStack {
                    if let pictureURL = viewModel.basketEntry?.pictureURL {
                        AnyView(AsyncImage(url: pictureURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }).frame(width: 72, height: 72)
                            .padding(8)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.basketEntry?.selectedItem?.attributes?.brand ?? "")
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallBoldStyle)
                        Text(viewModel.basketEntry?.selectedItem?.attributes?.name ?? "")
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                        Text(viewModel.basketEntry?.selectedItem?.capacity ?? "")
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
                            .padding(8)
                            .background(Capsule().fill(Color.miamColor(.backgroundSecondary)))
                        NavigationLink {
                            ItemSelectorV2()
                            //viewModel.replaceProduct()
                            
                        } label: {
                            Text("Remplacer")
                                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                                .foregroundColor(Color.miamColor(.primary))
                        }
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                }
                HStack {
                    Text(viewModel.basketEntry?.selectedItem?.attributes?.unitPrice ?? "")
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                        .padding(.horizontal, 12)
                        .foregroundColor(Color.miamColor(.primary))
                    Spacer()
                    if (viewModel.basketEntry?.attributes?.status != "active") {
                        Button {
                            viewModel.ignoreProduct()
                        } label: {
                            Text("Ignorer ce produit")
                                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                                .foregroundColor(Color.miamColor(.textPrimarySubdued))
                        }
                    }
                    if(viewModel.basketEntry?.attributes?.status == "active" )
                    {
                        HStack{
                            Button {
                                if(viewModel.basketEntry!.quantity == 1) {
                                    self.viewModel.ignoreProduct()
                                }else{
                                    self.viewModel.updateQuantity(quantity: max((Int(viewModel.basketEntry!.quantity) - 1), 1))
                                }
                                    
                            } label: {
                                Image.miamImage(icon: .minus)
                                    .renderingMode(.template).foregroundColor(.black)
                            }
                            Text("\(viewModel.basketEntry!.quantity)").frame(minWidth: 10, alignment: .center)

                            Image.miamImage(icon: .people).renderingMode(.template).foregroundColor(.black)
                            Button {
                                self.viewModel.updateQuantity(quantity: Int(Int32(viewModel.basketEntry!.quantity + 1)))
                            } label: {
                                Image.miamImage(icon: .plus)
                                    .renderingMode(.template).foregroundColor(.black)
                            }
                        }.padding(8).background(Capsule().foregroundColor(Color.white))
                            .padding(16)
                    }else{
                        
                        Button {
                            viewModel.addProduct()
                        } label: {
                            Image.miamNeutralImage(icon: .cart)
                                .padding(16)
                                .background(Color.miamColor(.primary).cornerRadius(8))
                                .frame(width: 48, height: 48)
                        }.padding(12)
                    }
                    
                }
            }.overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.miamColor(.backgroundSecondary), lineWidth: 1)
            )
        }
    }
}
                                                        
                                                
