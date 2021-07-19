//
//  ContentView.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 17/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
Text("Surveiller votre poids")
    TabView {
       accueil()
         .tabItem {
            Image(systemName: "house.circle")
            Text("Accueil")
       }
       pesee()
         .tabItem {
            Image(systemName: "timer")
            Text("Pesée")
      }
        profil()
        .tabItem {
           Image(systemName: "person")
           Text("Profil")
     }
    }
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct accueil: View {
    var body: some View {
        Color.red
    }
}
struct pesee: View {
    var body: some View {
        Color.blue
    }
}

struct profil: View {
    var body: some View {
        Color.orange
    }
}

