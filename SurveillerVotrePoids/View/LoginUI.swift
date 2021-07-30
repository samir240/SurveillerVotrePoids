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
    @State var selection: Int? = nil
    @State var isLinkActive:Int? = nil
    @State var isLinkActive2:Int? = nil
    var body: some View {
        NavigationView{
        VStack (spacing: 10){
            Image("losing")
                .resizable() .frame(width: 400, height: 400)

            
            Spacer()
        Text("Login")
            HStack{
                Text("Vous n'avez pas encore de compte?")
            NavigationLink(destination: SignUpUI(),tag: 1, selection:$isLinkActive2){
                
                
                Button(action: {
                    self.isLinkActive2 = 1
                }) {
                   
                    Text("S'inscrire")
                        
                    
                }
                
            }
           
            }
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
            
         
                NavigationLink(destination: ContentView(),tag: 1, selection:$isLinkActive){
               // Button(action: { print("login tapped")
                        //self.selection = 1}) {
             
                Text("Login")
                //}
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .medium))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(Color.purple.opacity(0.8))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
            }
            
        }
    }
}
}

struct LoginUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginUI()
    }
}
