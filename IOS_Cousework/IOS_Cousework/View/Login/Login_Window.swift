//
//  Login_Window.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-16.
//

import SwiftUI

struct Login_Window: View 
{
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var loginVM = Main_ViewModel.shared;
    //@ObservedObject var lloginVM = Main_ViewModel.shared;
    
    var body: some View
    {
        ZStack
        {
            Color.textColor_signUp
            //Color(red: 0, green: 128/255, blue: 128/255)
                .ignoresSafeArea()
            
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.1))
               .offset(x: 80, y: 20)
            
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.1))
               .offset(x: -80, y: -20)
            
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            
            VStack
            {
                Text("Login")
                    .font(Font.custom("Baskerville-bold", size: 25))
                    .bold()
                    .padding(.bottom, 5)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                
                Text("Enter your user credentials")
                    .font(Font.custom("Calibri", size: 16))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)

                VStack
                {
                    Cm_TextField(title: "User Name", placeholder: "Enter your user name here..",txt: $loginVM.txtUserName, keyboardType: .emailAddress)
                        .padding(.bottom, 20)
                                                        
                    Cm_SecureField(title: "Password", placeholder: "Enter your password here..", txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                }
                
                VStack
                {
                    Button("Login")
                    {
                        loginVM.serviceCallLogin()
                    }
                    .foregroundColor(.white).frame(width: 350, height: 50)
                    .background(Color.textColor_signUp)
                    //.background(Color(red: 0, green: 128/255, blue: 128/255))
                    .cornerRadius(10)
                    .padding(.top, 25)
                }
                
                HStack
                {
                    Text("Don't have an account?")
                        .foregroundColor(.black.opacity(0.5))
                    
                    Button(action:
                            {
                        //print("Signup button tapped")
                    })
                    {
                        Text("Signup")
                            .foregroundColor(.textColor_signUp)
                    }
                }
            }
            
            .padding(.leading)
        }
        .alert(isPresented: $loginVM.showError)
        {
            Alert(title: Text(Globs.AppName), message: Text(loginVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    Login_Window()
}
