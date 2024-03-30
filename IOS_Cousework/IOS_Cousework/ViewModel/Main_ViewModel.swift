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
    @Published var isUserLogin: Bool = false
    @Published var userObj: UserModel = UserModel(dict: [:])
    
    init() {
           
           
        if( Utils.UDValueBool(key: Globs.userLogin) ) {
                // User Login
                self.setUserData(uDict: Utils.UDValue(key: Globs.userPayload) as? NSDictionary ?? [:] )
            }else{
                // User Not Login
            }
           
            #if DEBUG
            txtUserName = "dilmi"
            txtUserEmail = "test6@gmail.com"
            txtPassword = "12345"
            #endif
           
        }
       
        func logout(){
            Utils.UDSET(data: false, key: Globs.userLogin)
            isUserLogin = false
        }

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
    
    func setUserData(uDict: NSDictionary)
    {
        Utils.UDSET(data: uDict, key: Globs.userPayload)
        Utils.UDSET(data: uDict, key: Globs.userLogin)
        
        self.userObj = UserModel(dict: uDict)
        self.isUserLogin = true
        
        self.txtUserName=""
        self.txtPassword=""
        self.txtUserEmail=""
        self.isShowPassword = false
    }
}

