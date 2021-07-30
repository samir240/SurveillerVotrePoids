//
//  SignUpUI.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 22/07/2021.
//

import SwiftUI

struct SignUpUI: View {
    @State var email = ""
    @State var password = ""
    @State var Cpassword = ""
    
    var body: some View {
        
        VStack (spacing: 10){
            Image("work")
                .resizable() .frame(width: 350, height: 350)
        Spacer()
    Text("SignUp")
        //Text("Already have an account? Sign in")
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
            
            HStack {
                Image (systemName: "lock")
                TextField("Confirm passsword", text: $Cpassword)
            }.padding(.all, 20)
            .padding(.horizontal, 20)
            .cornerRadius(8)
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("SignUp")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium))
        }).frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color.purple.opacity(0.8))
        .cornerRadius(8)
        .padding(.horizontal, 20)
    }
    }
}

struct SignUpUI_Previews: PreviewProvider {
    static var previews: some View {
        SignUpUI()
    }
}
