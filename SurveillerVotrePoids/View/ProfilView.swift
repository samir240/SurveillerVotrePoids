//
//  ProfilView.swift
//  SurveillerVotrePoids
//
//  Created by didier cassanhol on 19/07/2021.
//

import SwiftUI

struct ProfilView: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var sexe = ""
    @State private var age = 18
    @State private var taille = 170
    @State private var poids = 80
    @State private var poidsIdeal = 70
    @State private var dateNaiss = Date()
    
    var body: some View {

        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.4), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
         
            VStack{
                Spacer()
                ZStack{
                    VStack{
                    Circleimage()
                        Text("Prénom Nom").fontWeight(.bold);                       Text("Age")
                    }
                }
                Spacer()
                ZStack{
                    Color.white.opacity(0.35)
                                     .frame(width: 350, height: 500)
                                     .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                     .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                    // Ajout form
                                // Text("Profil")
                                 NavigationView {
                                 Form {
                                     // Form fields go here
                                     TextField("Prénom",
                                                       text: $firstname)
                                             TextField("Nom",
                                                       text: $lastname)
                                     /*Stepper(value: $age,
                                             in: 1...100,
                                             label: {
                                         Text("Age : \(self.age)")
                                     })*/
                                    DatePicker("Date de naissance : ", selection: $dateNaiss, displayedComponents: .date)
                                     Stepper(value: $taille,
                                             in: 120...250,
                                             label: {
                                         Text("Taille (cm) : \(self.taille)")
                                     })
                                     Stepper(value: $poids,
                                             in: 1...300,
                                             label: {
                                         Text("Poids actuel (kg) : \(self.poids)")
                                     })
                                     Stepper(value: $poidsIdeal,
                                             in: 1...300,
                                             label: {
                                         Text("Poids idéal (kg) : \(self.poidsIdeal)")
                                     })
                                     
                                     Picker(selection: $sexe,
                                            label: Text("Sexe")) {
                                             ForEach(SEXE.allSexe, id: \.self) { sexe in
                                                 Text(sexe).tag(sexe)
                                             }
                                     }
                                     Button(action: {
                                         print("Updated profile1")
                                     }, label: {
                                         Text("Enregistrer")
                                     })
                                    
                                 }
                          
                                 .navigationBarTitle(Text("Profil"))
                                 
                             }
                                 .frame(width: 400, height: 500)
                            // Fin Ajout form
                }
                Spacer()
            }
        
        
        }
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

struct SEXE {
    static let allSexe = [
        "Homme",
        "Femme"
    ]
}
