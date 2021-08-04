//
//  LoginUI.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 22/07/2021.
//

import SwiftUI
import Firebase

struct LoginUI: View {
    @State var email = ""
    @State var password = ""
    
    @State var user: User?
    @State var showMain = false
    
    @State var isAlertPresented = false
    @State var alertMessage = ""
    
    @State var selection: Int? = nil
    @State var isLinkActive:Int? = nil
    @State var isLinkActive2:Int? = nil
    
    @State var shouldNavigate = true
    
    var body: some View {
        
        VStack (spacing: 5) {
            Image("losing")
                .resizable() .frame(width: 250, height: 250)
            Spacer()
                    .frame(height: 10)
        //Text("Login")
            HStack{
                
                Text("Vous n'avez pas encore de compte?")
                Text("S'inscrire")
                
                Text("Hello navigation")
                            .overlay(NavigationLink(
                                destination: SignUpUI(),
                                isActive: $shouldNavigate) {}
                                .hidden())
            }
           
            HStack {
                Image (systemName: "envelope")
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
            }.padding(.all, 20)
            .padding(.horizontal, 20)
            .cornerRadius(8)
            
            HStack {
                Image (systemName: "lock")
                TextField("Passsword", text: $password)
                    .textContentType(.password)
                    .disableAutocorrection(true)
            }.padding(.all, 20)
            .padding(.horizontal, 20)
            .cornerRadius(8)
            
         
                //NavigationLink(destination: ContentView(),tag: 1, selection:$isLinkActive){
                Button(action: {
                    //self.hideKeybord()
                    Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
                        
                        if error != nil {
                            //print(error!.localizedDescription)
                            alertMessage = error!.localizedDescription
                            isAlertPresented = true
                        }
                        else {
                            if let user = authDataResult?.user {
                                self.user = user
                                self.showMain = true
                            }
                        }
                        }
                   
                            
                            
                            
                            
                            
                    }, label: {
                        //self.selection = 1}) {
             
                
                
                
                Text("Login")
                //}
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .medium))
                    }).frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(Color.purple.opacity(0.8))
            .cornerRadius(8)
            .padding(.horizontal, 20)
        }
                .fullScreenCover(isPresented: $showMain, content: {
                    Text("Connecté")
                })
        .alert(isPresented: $isAlertPresented, content: {
            Alert(title: Text(alertMessage))
        })
            
        
    }
}

struct LoginUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginUI()
    }
}
