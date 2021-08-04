//
//  ProfilView.swift
//  SurveillerVotrePoids
//
//  Created by didier cassanhol on 19/07/2021.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct ProfilView: View {
   var ref: DatabaseReference = Database.database().reference()
    
    @State private var firstname = "\(UserDefaults.standard.string(forKey: "prenom") ?? "")"
    @State private var lastname = UserDefaults.standard.string(forKey: "nom") ?? ""
    @State private var sexe = UserDefaults.standard.string(forKey: "sexe") ?? ""
    @State private var age = 18
    @State private var taille = UserDefaults.standard.integer(forKey: "taille") ?? 180
    @State private var poids = UserDefaults.standard.integer(forKey: "poids") ?? 73
    @State private var poidsIdeal = UserDefaults.standard.integer(forKey: "pideal") ?? 70
    @State private var dateNaiss = Date()
    
    
    struct globalString {
        static var stringy = ""
        static var temperature = 0.0
    }
  
    init() {
        print("batata")
        //self.ref.child("CxiKuzuE4zUEPs3iYkoEKV6bnZj1").observeSingleEvent(of: .value)
        self.ref.child("users/CxiKuzuE4zUEPs3iYkoEKV6bnZj1").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Got data \(snapshot.value!)")
                print(snapshot.childrenCount)
                
                let dict = snapshot.value as! [String: Any]
                print(dict["long"])
                //self.firstname = dict["long"] as? String ?? ""
                        //let owner = dict["owner"] as? String ?? ""
                let defaults = UserDefaults.standard
                defaults.set(dict["long"], forKey: "taille")
                defaults.set(dict["weiht"], forKey: "poids")
                defaults.set(dict["sexe1"], forKey: "sexe")
                defaults.set(dict["prenom"], forKey: "prenom")
                defaults.set(dict["pIdeal"], forKey: "pideal")
                defaults.set(dict["nom"], forKey: "nom")
            }
            else {
                print("No data available")
            }
            
        }
      print("apriiiiii")
        
    }
    
    var body: some View {
        

        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.4), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
         
            VStack{
                Spacer()
                ZStack{
                    VStack{
                    Circleimage()
                        
                      
                        Text("\(UserDefaults.standard.string(forKey: "prenom") ?? "Prénom") \(UserDefaults.standard.string(forKey: "nom") ?? "Nom")").fontWeight(.bold);
                        Text(UserDefaults.standard.string(forKey: "age") ?? "Age")
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
                                     poids
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
                                         print("dateNaiss")
                                        self.ref.child("users").child("CxiKuzuE4zUEPs3iYkoEKV6bnZj1").setValue(["prenom": firstname, "nom": lastname, "long" : taille,"weiht": poids, "pIdeal": poidsIdeal,"sexe1": sexe])
                                        
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
