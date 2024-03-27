//
//  MainScreen_View.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-17.
//

import SwiftUI

struct MainScreen_View: View 
{
    @StateObject var homeVM = Home_ViewModel.shared
    
    var body: some View
    {
        VStack
        {
            TabView(selection: $homeVM.selectTab)
            {
                Home_View().tag(0)
                Explore_View().tag(1)
                Explore_View().tag(2)
                Explore_View().tag(3)
                Explore_View().tag(4)
            }
            .onAppear
            {
                UIScrollView.appearance().isScrollEnabled = false
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeVM.selectTab)
            {
                newValue in debugPrint("sel tab:\(newValue)")
            }
            
            HStack
            {
                Home_Footer(title: "Shop", icon: "shop", isselect: homeVM.selectTab == 0)
                {
                    DispatchQueue.main.async 
                    {
                        withAnimation
                        {
                            homeVM.selectTab = 0
                        }
                    }
                }
                
                Home_Footer(title: "Explore", icon: "Explore", isselect: homeVM.selectTab == 1)
                {
                    DispatchQueue.main.async
                    {
                        withAnimation
                        {
                            homeVM.selectTab = 1
                        }
                    }
                }
                
                Home_Footer(title: "Cart", icon: "shopping-cart", isselect: homeVM.selectTab == 2)
                {
                    DispatchQueue.main.async
                    {
                        withAnimation
                        {
                            homeVM.selectTab = 2
                        }
                    }
                }
                
                Home_Footer(title: "Favourite", icon: "favourite", isselect: homeVM.selectTab == 3)
                {
                    DispatchQueue.main.async
                    {
                        withAnimation
                        {
                            homeVM.selectTab = 3
                        }
                    }
                }
                
                Home_Footer(title: "Account", icon: "user", isselect: homeVM.selectTab == 4)
                {
                    DispatchQueue.main.async
                    {
                        withAnimation
                        {
                            homeVM.selectTab = 4
                        }
                    }
                }

            }
            .padding(.top, 10)
            .padding(.bottom, .bottomInsets)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
    
}

struct MainScreen_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {
            MainScreen_View()
        }
    }
}
