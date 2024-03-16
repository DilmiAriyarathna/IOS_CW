//
//  Login_Window.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-16.
//

import SwiftUI

struct Login_Window: View 
{
    @StateObject var loginVM = Main_ViewModel.shared;
    //@ObservedObject var lloginVM = Main_ViewModel.shared;
    
    var body: some View
    {
        ZStack
        {
            Color(red: 0, green: 128/255, blue: 128/255)
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
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 35)
                
                VStack
                {
                    //Text("User Name")
                    // .font(.custom("verdena", size: 20))
                    //.frame(Width: 30, height: 50 .infinity, alignment: .leading)
                    //.padding(20)
                    
                    TextField("Enter your username here", text: $loginVM.txtUserName)
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    SecureField("Enter your passwrod here", text: $loginVM.txtPassword)
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    Divider()
                }
                VStack
                {
                    Button("Login")
                    {
                        
                    }
                    .foregroundColor(.white).frame(width: 350, height: 50)
                    .background(Color(red: 0, green: 128/255, blue: 128/255))
                    .cornerRadius(10)
                    .padding(.top, 25)
                }
            }
        }
    }
}

#Preview {
    Login_Window()
}
