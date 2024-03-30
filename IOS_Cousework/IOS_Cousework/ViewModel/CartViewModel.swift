//
//  CartViewModel.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-29.
//

import SwiftUI

class CartViewModel: ObservableObject
{
    static var shared: CartViewModel = CartViewModel()
    @Published var showError = false
    @Published var showOrderAccept = false
    @Published var errorMessage = ""
    
    @Published var listArr: [CartItemModel] = []
    @Published var total: String = "0.0"
    
    @Published var showCheckout: Bool = false
    
    @Published var showPickerAddress: Bool = false
    @Published var showPickerPayment: Bool = false
    @Published var showPickerPromoCode: Bool = false
    
    @Published var deliveryType: Int = 1
    @Published var paymentType: Int = 1
    //@Published var deliverObj: AddressModel?
    //@Published var paymentObj: PaymentModel?
    //@Published var promoObj: PromoCodeModel?
    
    @Published var deliverPriceAmount: String = ""
    @Published var discountAmount: String = ""
    @Published var userPayAmount: String = ""
    @Published var qty: Int = 1
    
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
    
}
