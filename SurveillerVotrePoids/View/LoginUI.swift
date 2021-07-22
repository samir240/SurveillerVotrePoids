//
//  LoginUI.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 22/07/2021.
//

import SwiftUI

struct LoginUI: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack (spacing: 15){
            Spacer()
        Text("Login")
            Text("Already have an account? Sign in")
            HStack {
                Image (systemName: "envelope")
                TextField("Email", text: $email)
            }.padding(.all, 20)
            .padding(.horizontal, 20)
            .cornerRadius(8)
            
            HStack {
                Image (systemName: "lock")
                TextField("Passsword", text: $password)
            }.padding(.all, 20)
            .padding(.horizontal, 20)
            .cornerRadius(8)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Login")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .medium))
            }).frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(Color.green.opacity(0.8))
            .cornerRadius(8)
            .padding(.horizontal, 20)
        }
    }
}

struct LoginUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginUI()
    }
}
