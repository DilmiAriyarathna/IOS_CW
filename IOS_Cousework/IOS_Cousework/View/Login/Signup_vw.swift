//
//  Signup_vw.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-16.
//

import SwiftUI

struct Signup_vw: View 
{
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var mainVM = Main_ViewModel.shared;
    
    var body: some View
    {
        ZStack()
        {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .scale(1.7)
                .foregroundColor(Color.textColor_signUp.opacity(0.8))
                .offset(x: -180, y: -620)
            
            Circle()
                .scale(1.7)
                .foregroundColor(Color.textColor_signUp.opacity(0.5))
                .offset(x: 380, y: -600)
            
            VStack
            {
                Text("FASHION NOVA")
                    .font(Font.custom("Baskervilla-Bold", size: 30))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.top, -400)
                    .bold()
                    .foregroundColor(.black)
            }
            .padding(.init(top: 30, leading: 10, bottom: 0, trailing: 0))
            
            VStack
            {
                Text("Sign Up")
                    .font(Font.custom("Baskerville-bold", size: 25))
                    .bold()
                    .padding(.bottom, 25)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                
                //Divider()
                
                Cm_TextField(title: "User Name", placeholder: "Enter your user name here..",txt: $mainVM.txtUserName, keyboardType: .emailAddress)
                    .padding(.bottom, 20)
                
                Cm_TextField(title: "Email", placeholder: "Enter your email here..",txt: $mainVM.txtUserEmail, keyboardType: .emailAddress)
                    .padding(.bottom, 20)
                
                Cm_SecureField(title: "Password", placeholder: "Enter your password here..", txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                    .padding(.bottom, 20)
                
                Button("Sign Up")
                {
                    
                }
                .foregroundColor(.white)
                .frame(width: 350, height: 50)
                .background(Color.textColor_signUp)
                .cornerRadius(10)
                
                HStack
                {
                    Text("Already have an account?")
                        .foregroundColor(.black.opacity(0.5))
                    
                    Button(action:
                            {
                        //print("Signup button tapped")
                    })
                    {
                        Text("Sign in")
                            .foregroundColor(.textColor_signUp)
                    }
                }
            }
            .padding(.leading)
        }
    }
}


#Preview {
    Signup_vw()
}
