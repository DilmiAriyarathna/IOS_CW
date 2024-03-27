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
    
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var txtUserEmail: String = ""
    //@Published var txtPassword: String = ""
    
    //MARK: ServiceCall
    func serviceCallLogin()
    {
        if(txtUserName.isEmpty)
        {
            self.errorMessage = "Please enter username"
            self.showError = true
            return
        }
        
        if(txtPassword.isEmpty)
        {
            self.errorMessage = "Please enter valid password"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["username": txtUserName, "password": txtPassword], path: Globs.SV_LOGIN)
        {
            responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    print(response);
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                }else
                {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        }
    failure: { error in
        self.errorMessage = error?.localizedDescription ?? "Fail"
        self.showError = true
        }
    }
}

