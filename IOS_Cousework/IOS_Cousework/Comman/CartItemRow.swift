//
//  CartItemRow.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-30.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemRow: View {
    @State var cObj: CartItemModel = CartItemModel(dict: [:])
    
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                //WebImage(url: URL(string: fObj.image ))
                WebImage(url: URL(string: "https://thebasiclook.com/cdn/shop/products/20221002-DSCF2514_1200x1277.jpg?v=1665837978"))          .resizable()
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                VStack(spacing: 4){
                    HStack{
                        //Text(fObj.name)
                        Text("Long Sleev Men's Balck TShirt")
                            .font(.customfont(.bold, fontsize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button{
                            
                        }label: {
                            Image("close")
                                .resizable()
                                .frame(width: 18, height: 18)
                        }
                    }
                    //Text("\(fObj.unitValue)\(fObj.unitName), price")
                    Text("1 x T-Shirt, Price")
                        .font(.customfont(.medium, fontsize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        Button{
                            
                        }label: {
                            Image("subtack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        .padding(4)
                        .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.placeholder.opacity(0.5), lineWidth: 1))
                        
                        Text("1")
                            .font(.customfont(.bold, fontsize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.placeholder.opacity(0.5), lineWidth: 1))
                        
                        Button{
                            //detailVM.addSubQTY(isAdd: true)
                        } label:
                        {
                            Image("add_green")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        .padding(4)
                        .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.placeholder.opacity(0.5), lineWidth: 1))
                        
                        Spacer()
                        
                        //Text("$\(fObj.offerPrice ?? fObj.price, specifier: "%.2f" )")
                        Text("RS 3950.00")
                            .font(.customfont(.semibold, fontsize: 18))
                            .foregroundColor(.primaryText)                
                    }
                }
            }
            Divider()
        }
    }
}

struct CartItemRow_Previews: PreviewProvider {
    static var previews: some View {
        CartItemRow()
            .padding(.horizontal, 20)
    }
}


