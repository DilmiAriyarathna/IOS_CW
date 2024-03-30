//
//  RoundButton.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-29.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        Button{
            didTap?()
        }label: {
            Text(title)
                .font(.customfont(.semibold, fontsize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.textColor_signUp)
        .cornerRadius(20)
    }
}

struct RoundButton_Previews: PreviewProvider{
    
    static var previews: some View{
        RoundButton()
            .padding(20)
    }
}
