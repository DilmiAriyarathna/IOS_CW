//
//  Cm_productList.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-23.
//

import SwiftUI
import SDWebImageSwiftUI

struct Cm_productList: View
{
    @State var pObj:ProductModel = ProductModel(dict: ["id": 1,
                                                       "mcat": "Men Clothes",
                                                       "scat": "Tshirt",
                                                       "brand": "No Brand",
                                                       "type": "Regular",
                                                       "name": "Long Sleev Men's Balck TShirt",
                                                       "quantity": 1,
                                                       "price": "RS. 3590.00",
                                                       "details": "Step out in style and charm in this round neck, full sleevs T-Shirt Add this upper stylish and super comfotable t-shirt to your collectionof T-Shirts. This is creafted using the fine quality soft cotton blend fabric. Wear this T-Shirt in spring and summers. Fabric & Carer: Made with Knitted Cotton Blend Fabric: Regular Machine wash",
                                                       "unitname": "T-Shirt",
                                                       "unitvalue": "1",
                                                       "image": "https://static-01.daraz.lk/p/970102dd9f884715f0c7a0d3baa56eb2.png",
                                                       "size": "S | M | L | XL",
                                                       "variations": "",
                                                       "clothingmeterial": "Cotton",
                                                       "sleeves": "LOng Sleeve",
                                                       "dressshape": "",
                                                       "collartype": "O-Neck",
                                                       "boxcontent": "1 x T-Shirt",
                                                       "sizeimg": "",
                                                       "neckline": "Round",
                                                       "sleevlength": "Long",
                                                       "colors": "Black | White"
])
    //
    var didAddCart: ( ()->() )?
    
    
    var body: some View
    {
        VStack
        {
            Image("1")
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 80)
            
            Spacer()
            
            Text("Long Sleev Men's Balck TShirt")
                .font(.customfont(.bold, fontsize: 16))
                .bold()
                .foregroundColor(.primaryText)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            
            Text("1 x T-Shirt")
                .font(.customfont(.medium, fontsize: 14))
                .foregroundColor(.primaryText)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack {
                Text("Rs 1500.00")
                    .font(.customfont(.medium, fontsize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button
                {
                    didAddCart?()
                } label: {
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 35, height: 35)
                .background(Color.primaryApp)
                .cornerRadius(15)
            }
        }
        .padding(15)
        .frame(width: 180, height: 230)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primaryText.opacity(0.5), lineWidth: 1)
        )
    }
}

struct Cm_productList_Previews: PreviewProvider
{
    static var previews: some View
    {
        Cm_productList()
    }
}
