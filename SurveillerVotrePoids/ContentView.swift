//
//  ContentView.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 17/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Surveiller votre poids")
        TabView {
            BodyView()
                .tabItem {
                    Image(systemName: "house.circle")
                    Text("Accueil")
                }
            WeighingView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Pesée")
                }
            ProfilView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profil")
                }
        }
      
        .accentColor(.purple)
        
            //UITabBar.appearance().barTintColor = .black
        }
    }




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


