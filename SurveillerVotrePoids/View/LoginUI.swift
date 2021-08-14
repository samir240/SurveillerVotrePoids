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
    @State var showView = true
    
    @State var goWhenTrue: Bool = true
    
    var body: some View {
        NavigationView {
        VStack (spacing: 5) {
            Image("losing")
                .resizable() .frame(width: 250, height: 250)
            Spacer()
                    .frame(height: 10)
        //Text("Login")
            HStack{
                
                Text("Vous n'avez pas encore de compte?")
                
                   
                        NavigationLink(destination: SignUpUI()) {
                            Text("S'inscrire")
                        }
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
        
            
            Text("Primary View")
            /// 2
            
        
       
            
                Button("login"){
                print("fdtfzdftzfdtzfdztfd")
                    goWhenTrue = true
                    //self.hideKeybord()
                    Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
                        
                        if error != nil {
                            //print(error!.localizedDescription)
                            alertMessage = error!.localizedDescription
                            isAlertPresented = true
                        }
                        else {
                            if let user = authDataResult?.user {
                                print("okkkkkkkkkkkkkk")
                                
                                self.user = user
                               // self.showMain = true
                                self.isLinkActive = 1
                                
                            }
                                                  }
                        }
                    print(showView)
                   print("232323232323")
                    NavigationLink(destination: ContentView(), isActive: $showView){}
                            
                    }
            
        }
 
        .alert(isPresented: $isAlertPresented, content: {
            Alert(title: Text(alertMessage))
        })
          
        
    }
    }
}

struct LoginUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginUI()
    }
}
