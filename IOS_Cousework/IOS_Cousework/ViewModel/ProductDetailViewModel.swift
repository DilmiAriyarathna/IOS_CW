//
//  ProductDetailViewModel.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-24.
//

import SwiftUI

class ProductDetailViewModel: ObservableObject
{
    @Published var pObj: ProductModel = ProductModel(dict: [:])
    
    @Published var showError = false;
    @Published var errorMessage = "";
    
    @Published var specificationArr: [ProductSpecificationModel] = []
    @Published var imageArr: [ImageModel] = []
    
    @Published var isFav: Bool = false
    @Published var isShowDetail: Bool = false
    @Published var isShowSpecification: Bool = false
    @Published var qty: Int = 1
    
    func showDetails()
    {
        isShowDetail = !isShowDetail
    }
    
    func showSpecification()
    {
        isShowSpecification = !isShowSpecification
    }
    
  
    func addSubQTY(isAdd: Bool = true)
    {
        if(isAdd){
            qty += 1
            if(qty > 99)
            {
                qty = 99
            }
        }
            else
        {
                qty -= 1
                if(qty < 1)
                {
                    qty = 1
                }
            }
    }
    
    init(prodObj: ProductModel)
    {
        self.pObj = prodObj
        self.isFav = prodObj.isFav
        ServiseCallDetail()
    }
    
    //MARK: ServiceCall
    func ServiseCallDetail()
    {
        ServiceCall.post(parameter: ["product_id": self.pObj.id], path: Globs.SV_PRODUCT_DETAIL, isToken: true)
        {
            responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"
                {
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary
                    {
                        self.pObj = ProductModel(dict: payloadObj)
                        
                        self.specificationArr = (payloadObj.value(forKey: "productspecifications") as? NSArray ?? []).map({
                            obj in
                            
                            return ProductSpecificationModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.imageArr = (payloadObj.value(forKey: "images") as? NSArray ?? []).map({
                            obj in
                            
                            return ImageModel(dict: obj as? NSDictionary ?? [:])
                        })                    }
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
            failure: 
        { error in
                self.errorMessage = error?.localizedDescription ?? "Fail"
                self.showError = true
        }
    }
    
    // ADD Remove FAV
    //
}



