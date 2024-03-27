//
//  Home_ViewModel.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-17.
//

import SwiftUI

class Home_ViewModel: ObservableObject
{
    static var shared: Home_ViewModel = Home_ViewModel()
    @State var selectTab: Int = 0
    @State var txtSearch: String = ""
}

