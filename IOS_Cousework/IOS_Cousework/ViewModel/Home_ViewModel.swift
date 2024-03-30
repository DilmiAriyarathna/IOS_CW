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
    
    @Published var showError = false;
    @Published var errorMessage = "";
    
    @Published var offerArr: [ProductModel] = []
    
    
    
    init()
    {
        ServiseCallList()
    }
    
    //MARK: ServiceCall
    func ServiseCallList()
    {
        ServiceCall.post(parameter: [:], path: Globs.SV_HOME, isToken: true)
        {
            responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" 
                {
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary
                    {
                        self.offerArr = (payloadObj.value(forKey: "clothingproducts") as? NSArray ?? []).map({
                             obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                    print(response);
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                }
                else
                {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        }
    failure: { error in
        self.errorMessage = error?.localizedDescription ?? "Fail"
        self.showError = true
        }    }
    
}

