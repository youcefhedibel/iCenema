//
//  BackButton.swift
//  iCenema
//
//  Created by mac on 12/12/2023.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        HStack{
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.backward.circle.fill")
                    .foregroundColor(.primaryText)
                    .font(.system(size: 25))
                Text("Back")
                    .font(.primaryText, .regular, 18)
            }
            Spacer()
        }.padding()
    }
}
