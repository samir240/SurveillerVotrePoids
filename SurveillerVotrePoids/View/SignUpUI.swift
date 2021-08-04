//
//  SignUpUI.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 22/07/2021.
//

import SwiftUI
import Firebase

struct SignUpUI: View {
    @State var email = ""
    @State var password = ""
    @State var Cpassword = ""
    
    @State var user: User?
    @State var showMain = false
    @State var loading = false
    
    @State var isAlertPresented = false
    @State var alertMessage = ""
    
    var body: some View {
        
        VStack (spacing: 5){
            Image("work")
                .resizable().frame(width: 200, height: 200)
        Spacer()
            .frame(height: 10)
    //Text("SignUp")
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
        
            Button(action: {
                
            // create user with Email
                
                Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
                    
                    if error != nil {
                        alertMessage = error!.localizedDescription
                        isAlertPresented = true
                        
                    } else {
                        Auth.auth().currentUser?.sendEmailVerification(completion: {
                            (error) in
                            if error == nil {
                                alertMessage = "Votre compte a bien été créé !. un email vous a été envoyé"
                                isAlertPresented = true
                            }
                        })
                    }
                }
                
                
                
                
                
                
            }, label: {
            Text("SignUp")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium))
        }).frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color.purple.opacity(0.8))
        .cornerRadius(8)
        .padding(.horizontal, 20)
    }
        .alert(isPresented: $isAlertPresented, content: {
            Alert(title: Text(alertMessage))
        })
    }
}

struct SignUpUI_Previews: PreviewProvider {
    static var previews: some View {
        SignUpUI()
    }
}
