//
//  ImageModel.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-29.
//

import SwiftUI

struct ImageModel: Identifiable, Equatable
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
    
    static func == (lhs: ImageModel, rhs: ImageModel) -> Bool{
        return lhs.id == rhs.id;
    }
}
