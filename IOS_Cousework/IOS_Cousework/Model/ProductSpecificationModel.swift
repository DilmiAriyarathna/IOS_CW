//
//  ProductSpecificationModel.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-28.
//

import SwiftUI

struct ProductSpecificationModel: Identifiable, Equatable
{
    var id: Int = 0
    var specificationName: String = ""
    var specificationValue: String = ""
    
    init(dict: NSDictionary)
    {
        self.id = dict.value(forKey: "specification_id") as? Int ?? 0
        self.specificationName = dict.value(forKey: "specification_name") as? String ?? ""
        self.specificationValue = dict.value(forKey: "specification_value") as? String ?? ""
    }
    
    static func == (lhs: ProductSpecificationModel, rhs: ProductSpecificationModel) -> Bool{
        return lhs.id == rhs.id;
    }
}
