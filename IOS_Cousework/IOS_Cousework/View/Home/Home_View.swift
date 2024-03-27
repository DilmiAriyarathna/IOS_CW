//
//  Home_View.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-17.
//

import SwiftUI

struct Home_View: View 
{
    @StateObject var homeViewM = Home_ViewModel.shared
    var body: some View
    {
        ZStack
        {
            ScrollView
            {
                VStack
                {
                    Image("Main-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                    
                    SearchTextField(_placeHolder: "Search Store", _txt: $homeViewM.txtSearch)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                }
                .padding(.top)
                
                Image("h")
                    .resizable()
                    .scaledToFit()
                //.padding(.vertical, 10)
                    .padding(.horizontal, 20)
                
                SectionTitleAll(title: "Exclusive offer", titleAll: "See All")
                {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false)
                {
                    LazyHStack(spacing: 15) 
                    {
                        ForEach(0...5, id: \.self)
                        {
                            index in
                            Cm_productList
                            {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                
                Image("34")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 0.1)
                .padding(.horizontal, 20)
                
                Image("2w")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 0.1)
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    Home_View()
}
