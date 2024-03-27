//
//  Cm_TextField.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-16.
//

import SwiftUI

struct Cm_TextField: View 
{
    @State var title: String = "Title"
    @State var placeholder: String = "placeholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    @State var isPassword: Bool =  false
    
    var body: some View
    {
       VStack
        {
            Text(title)
                .font(Font.custom("Calibri", size: 15))
                .foregroundColor(.textTitle)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            
            if(isPassword)
            {
                SecureField(placeholder, text: $txt)
            }
            else
            {
                TextField(placeholder, text: $txt)
            }
            Divider()
        }
    }
}

struct Cm_SecureField: View
{
    @State var title: String = "Title"
    @State var placeholder: String = "placeholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    
    var body: some View
    {
       VStack
        {
            Text(title)
                .font(Font.custom("Calibri", size: 15))
                .foregroundColor(.textTitle)
                .autocapitalization(.none)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if(isShowPassword)
            {
                TextField(placeholder, text: $txt)
                .modifier(Showbutton(isShow: $isShowPassword))            }
            else
            {
                SecureField(placeholder, text: $txt)
                .modifier(Showbutton(isShow: $isShowPassword))
            }
            Divider()
        }
    }
}

struct Cm_TextField_Priviews: PreviewProvider
{
    @State static var txt: String = ""
    static var previews: some View
    {
        Cm_TextField(txt: $txt)
            .padding(20)
    }
}
