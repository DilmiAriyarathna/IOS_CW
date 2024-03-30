//
//  ProductModel.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-27.
//

import SwiftUI

struct ProductModel: Identifiable, Equatable
{
    var id: Int = 0
    var mcat: String = ""
    var scat: String = ""
    var brand: String = ""
    var type: String = ""
    var name: String = ""
    var qty: Int = 0
    var price: String = ""
    var details: String = ""
    var unitname: String = ""
    var unitvalue: String = ""
    var image: String = ""
    var size: String = ""
    var variations: String = ""
    var clothingmeterial: String = ""
    var sleeves: String = ""
    var dressshape: String = ""
    var collartype: String = ""
    var boxcontent: String = ""
    var sizeimg: String = ""
    var neckline: String = ""
    var sleevlength: String = ""
    var colors: String = ""
    var isFav: Bool = false
    
    init (dict: NSDictionary)
    {
        self.id = dict.value(forKey: "id") as? Int ?? 0
        self.qty = dict.value(forKey: "quantity") as? Int ?? 0
        self.isFav = dict.value(forKey: "is_Fav") as? Int ?? 0 == 1
        
        self.mcat = dict.value(forKey: "mcat") as? String ?? ""
        self.scat = dict.value(forKey: "scat") as? String ?? ""
        self.brand = dict.value(forKey: "brand") as? String ?? ""
        self.type = dict.value(forKey: "type") as? String ?? ""
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.price = dict.value(forKey: "price") as? String ?? ""
        self.details = dict.value(forKey: "details") as? String ?? ""
        self.unitname = dict.value(forKey: "unitname") as? String ?? ""
        self.unitvalue = dict.value(forKey: "unitvalue") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.size = dict.value(forKey: "size") as? String ?? ""
        self.variations = dict.value(forKey: "variations") as? String ?? ""
        self.clothingmeterial = dict.value(forKey: "clothingmeterial") as? String ?? ""
        self.sleeves = dict.value(forKey: "sleeves") as? String ?? ""
        self.dressshape = dict.value(forKey: "dressshape") as? String ?? ""
        self.collartype = dict.value(forKey: "collartype") as? String ?? ""
        self.boxcontent = dict.value(forKey: "boxcontent") as? String ?? ""
        self.sizeimg = dict.value(forKey: "sizeimg") as? String ?? ""
        self.neckline = dict.value(forKey: "neckline") as? String ?? ""
        self.sleevlength = dict.value(forKey: "sleevlength") as? String ?? ""
        self.colors = dict.value(forKey: "colors") as? String ?? ""
    }
    
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool
    {
        return lhs.id == rhs.id
    }
}
