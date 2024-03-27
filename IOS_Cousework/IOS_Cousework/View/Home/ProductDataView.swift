//
//  ProductDataView.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-24.
//

import SwiftUI

struct ProductDataView: View 
{
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    var body: some View
    {
        ZStack
        {
            VStack
            {
                HStack
                {
                    Button
                    {
                        mode.wrappedValue.dismiss()
                    } label:
                    {
                        Image("back-button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 100)
                    }
                    .padding(.horizontal, 25)
                    
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ProductDataView()
}
