//
//  Main_ViewModel.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-16.
//

import SwiftUI

class Main_ViewModel: ObservableObject
{
    static var shared: Main_ViewModel = Main_ViewModel()
    
    @Published var txtUserName: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
}

