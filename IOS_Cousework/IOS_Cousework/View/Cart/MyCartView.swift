//
//  MyCartView.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-30.
//

import SwiftUI

struct MyCartView: View {
    @StateObject var cartVM = CartViewModel.shared
    var body: some View {
        ZStack{
            
            if(cartVM.listArr.count == 0)
            {
                //Text("Your Cart is Empty")
                    //.font(.customfont(.bold, fontsize: 20))
            }
            
            ScrollView
            {
                LazyVStack()
                {
                    CartItemRow()
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
            }
            
            VStack{
                HStack{
                    Spacer()
                    
                    Text("My Cart")
                        .font(.customfont(.bold, fontsize: 20))
                        .frame(height: 46)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                
                Spacer()
                
                if(cartVM.listArr.count == 0){
                    Button{
                        //cartVM.showCheckout = true
                    }
                    //.background(Color.textColor_signUp)                    //RoundButton(title: "Add To Cart"){
                    label: {
                        ZStack{
                            Text("Check Out")
                                .font(.customfont(.semibold, fontsize: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            HStack{
                                Spacer()
                                Text("RS 3950.00")
                                    .font(.customfont(.semibold, fontsize: 12))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(5)
                            }
                            .padding(.trailing)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color.textColor_signUp)       .cornerRadius(20)
                    .padding(.horizontal, 20)
                    .padding(.bottom, .bottomInsets + 80)
                }
                
            }
            if(cartVM.showCheckout){
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation{
                            cartVM.showCheckout = false
                        }
                    }
                CheckoutView()
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
            
            .alert(isPresented: $cartVM.showError, content: {
                Alert(title: Text(Globs.AppName), message: Text(cartVM.errorMessage), dismissButton: .default(Text("OK")))
            })
            .ignoresSafeArea()
        }
    }


struct MyCartView_Previews: PreviewProvider{
    static var previews: some View{
        MyCartView()
    }
}
