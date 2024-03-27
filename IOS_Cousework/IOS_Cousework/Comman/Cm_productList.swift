//
//  Cm_productList.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-23.
//

import SwiftUI

struct Cm_productList: View 
{
    var didAddCart: ( ()->() )?
    
    
    var body: some View
    {
        VStack
        {
            Image("1")
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 80)
            
            Spacer()
            
            Text("Test Product Name")
                .font(.customfont(.bold, fontsize: 16))
                .bold()
                .foregroundColor(.primaryText)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            
            Text("test second menu")
                .font(.customfont(.medium, fontsize: 14))
                .foregroundColor(.primaryText)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack {
                Text("Rs 1500.00")
                    .font(.customfont(.medium, fontsize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button
                {
                    didAddCart?()
                } label: {
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 35, height: 35)
                .background(Color.primaryApp)
                .cornerRadius(15)
            }
        }
        .padding(15)
        .frame(width: 180, height: 230)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primaryText.opacity(0.5), lineWidth: 1)
        )
    }
}

struct Cm_productList_Previews: PreviewProvider
{
    static var previews: some View
    {
        Cm_productList()
    }
}
