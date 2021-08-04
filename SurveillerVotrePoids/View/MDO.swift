//
//  MDO.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 03/08/2021.
//

import SwiftUI
import Firebase

struct MDO: View {
    
    @State var email = ""
    @State var loading = false
    
    @State var isValidated = false
    @State var message = ""
    
    
    
    
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                TextField("Email", text: $email)
                    .font(.title3)
                    .disabled(loading ? true: false)
            
            
                Button(action: {
                    
                    forgotPassword(for: email)
                    
                }, label: {
                    Text("Envoyer")
                        .font(.title3)
                })
                .disabled(loading ? true : false)
                
                Spacer()
                    .blur(radius: loading ? 1 : 0)
                if loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .background(RoundedRectangle(cornerRadius: 20, style: .circular).strokeBorder(Color.black)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .background(Color.white)
                        )
                }
            }
            .navigationTitle("Mot de passe oublié")
            .alert(isPresented: $isValidated) { () -> Alert in
                Alert(title: Text(message))
            }
        }
     
    }
    func forgotPassword(for email: String) {
        withAnimation {
            loading = true
        }
        Auth.auth().sendPasswordReset(withEmail: email) {
            (error) in
            
            if error == nil {
                message = "Mot de passe envvoyé"
            } else {
                message = error!.localizedDescription
            }
            isValidated = true
    }
    }
}

struct MDO_Previews: PreviewProvider {
    static var previews: some View {
        MDO()
    }
}
