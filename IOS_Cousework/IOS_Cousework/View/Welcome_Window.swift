//
//  Welcome_Window.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-16.
//

import SwiftUI

struct Welcome_Window: View 
{
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View
    {
        if isActive
        {
            Login_Window()
        }
        else
        {
            VStack
            {
                Image("Start")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //.clipped()
                    .opacity(10)

                    VStack
                    {
                        Text("FASHION NOVA")
                            .font(Font.custom("Baskerville-Bold", size: 40))
                            .foregroundColor(.black.opacity(0.9))
                            .padding()
                        
                        Text("Exceptional Modern Clothing..")
                            .font(Font.custom("Baskerville", size: 24))
                            .foregroundColor(.black.opacity(0.9))
                            .padding()
                        
                        Text("Shop For Modern Exceptional Clothings For Your Every Daily Life.")
                            .font(Font.custom("Baskerville", size: 20))
                      Spacer()
                        
                        
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    
                    .onAppear
                    {
                        withAnimation(.easeIn(duration: 2.0))
                        {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
            }
            .onAppear
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0)
                {
                    withAnimation
                    {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct Welcome_Window_Previews: PreviewProvider
{
    static var previews: some View
    {
        Welcome_Window()
    }
}
