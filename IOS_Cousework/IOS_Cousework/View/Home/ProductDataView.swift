//
//  ProductDataView.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDataView: View 
{
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var detailVM: ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]))
    
    var body: some View
    {
        ZStack
        {
            ScrollView
            {
                ZStack{
                    Rectangle()
                        .foregroundColor( Color(hex: "F2F2F2"))
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                        .cornerRadius(20, corner: [.bottomLeft, .bottomRight])
                    
                        WebImage(url: URL(string: "https://thebasiclook.com/cdn/shop/products/20221002-DSCF2514_1200x1277.jpg?v=1665837978"))
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                }
                .frame(width: .screenWidth, height: .screenWidth * 0.8)
                
                VStack{
                    HStack{
                        Text("Long Sleev Men's Balck TShirt")
                            .font(.customfont(.bold, fontsize: 24))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                        Button{
                            detailVM.isFav = !detailVM.isFav;
                        }label: {
                            Image( detailVM.isFav ? "fav" : "fav2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(Color.secondaryText)
                    }
                    
                    Text("1 X T-Shirt , Price")
                        .font(.customfont(.semibold, fontsize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack
                    {
                        Button{
                            detailVM.addSubQTY(isAdd: false)
                        } label:
                        {
                            Image("subtack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Text("\(detailVM.qty)")
                            .font(.customfont(.bold, fontsize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.placeholder.opacity(0.5), lineWidth: 1))
                        
                        Button{
                            detailVM.addSubQTY(isAdd: true)
                        } label:
                        {
                            Image("add_green")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Spacer()
                        Text("RS. 3590.00")
                            .font(.customfont(.bold, fontsize: 24))
                            .foregroundColor(.primaryText)
                    }
                    .padding(.vertical, 8)
                    Divider()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                // VIEW: PRODUCT DETAILS
                VStack
                {
                    HStack
                    {
                        Text("Product Details")
                            .font(.customfont(.semibold, fontsize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                        Button{
                            withAnimation{
                                detailVM.showDetails()}
                        }label: {
                            Image( detailVM.isShowDetail ? "next" : "detail_open")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)
                    }
                    if(detailVM.isShowDetail){
                        Text("Step out in style and charm in this round neck, full sleevs T-Shirt Add this upper stylish and super comfotable t-shirt to your collectionof T-Shirts. This is creafted using the fine quality soft cotton blend fabric. Wear this T-Shirt in spring and summers. Fabric & Carer: Made with Knitted Cotton Blend Fabric: Regular Machine wash")
                            .font(.customfont(.medium, fontsize: 13))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                // VIEW: END PRODUCT DETAILS
                
                
                //SPECIFICATION DETAILS
                VStack
                   {
                       HStack
                       {
                           Text("Specifications")
                               .font(.customfont(.semibold, fontsize: 16))
                               .foregroundColor(.primaryText)
                               .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                           Button{
                               withAnimation{
                                   detailVM.showSpecification()
                               }
                           }label: {
                               Image( detailVM.isShowSpecification ? "next" : "detail_open")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 15, height: 15)
                                   .padding(15)
                           }
                           .foregroundColor(Color.primaryText)
                       }
                       
                       if(detailVM.isShowSpecification){
                           LazyVStack{
                               ForEach( detailVM.specificationArr, id: \.id) { nObj in
                                   HStack{
                                       Text( nObj.specificationName)
                                           .font(.customfont(.semibold, fontsize: 15))
                                           .foregroundColor(.secondaryText)
                                           .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                       
                                       Text( nObj.specificationValue)
                                           .font(.customfont(.semibold, fontsize: 15))
                                           .foregroundColor(.primaryText)
                                   }
                                   Divider()
                               }
                               .padding(.vertical, 0)
                           }
                           .padding(.horizontal, 10)
                       }
                       
                       Divider()
                   }
                .padding(.horizontal, 20)
                // END OF SPECIFICATION DETAILS
                
                // START REVIEW SECTION
                HStack{
                    Text("Review")
                        .font(.customfont(.semibold, fontsize: 16))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 2){
                        ForEach( 1...5, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor( Color.orange)
                                .frame(width: 15, height: 15)
                        }
                    }
                    
                    Button{
                        
                    } label: {
                        Image("detail_open")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(15)                   
                    }
                    .foregroundColor(Color.primaryText)
                }
                .padding(.horizontal, 20)
                
                Divider()
                // END REVIEW SEC
                
                //ADD TO CART BTN START
                RoundButton(title: "Add To Cart"){
                    
                }
                .padding(20)
                //ADD TO CART BTN END
            }
            
            
            VStack
            {
                HStack
                {
                    Button
                    {
                        mode.wrappedValue.dismiss()
                    } label:
                    {
                        Image("back-button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 100)
                    }
                    .padding(.horizontal, 25)
                    
                    Spacer()
                }
                Spacer()
            }
        }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }

struct ProductDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        ProductDataView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: ["id": 1,
                                                                                      "mcat": "Men Clothes",
                                                                                      "scat": "Tshirt",
                                                                                      "brand": "No Brand",
                                                                                      "type": "Regular",
                                                                                      "name": "Long Sleev Men's Balck TShirt",
                                                                                      "price": "RS. 3590.00",
                                                                                      "details": "Step out in style and charm in this round neck, full sleevs T-Shirt Add this upper stylish and super comfotable t-shirt to your collectionof T-Shirts. This is creafted using the fine quality soft cotton blend fabric. Wear this T-Shirt in spring and summers. Fabric & Carer: Made with Knitted Cotton Blend Fabric: Regular Machine wash",
                                                                                      "unitname": "T-Shirt",
                                                                                      "unitvalue": "1",
                                                                                      "image": "https://thebasiclook.com/cdn/shop/products/20221002-DSCF2514_1200x1277.jpg?v=1665837978",
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
                                                                                      "colors": "Black | White"])))
    }
}
