//
//  Globs.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-27.
//

import SwiftUI

struct Globs
{
 static let AppName = "FashionNova"
    static let BASE_URL = "http://localhost:3000/api/"
    
    static let userPayload = "usre_payload"
    static let userLogin = "user_login"
    
    
    static let SV_LOGIN = BASE_URL + "login"
    static let SV_HOME = BASE_URL + "clothingproducts"
    static let SV_PRODUCT_DETAIL = BASE_URL + "clothingproducts"
    
    static let SV_ADD_CART = BASE_URL + "add_to_cart"
    static let SV_UPDATE_CART = BASE_URL + "update_cart"
    static let SV_REMOVE_CART = BASE_URL + "remove_cart"
    static let SV_CART_LIST = BASE_URL + "cart_list"
}

struct KKey{
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}

class Utils {
    class func UDSET(data: Any, key: String) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
   
    class func UDValue( key: String) -> Any {
       return UserDefaults.standard.value(forKey: key) as Any
    }
   
    class func UDValueBool( key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
   
    class func UDValueTrueBool( key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? true
    }
   
    class func UDRemove( key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
