//
//  BodyView.swift
//  SurveillerVotrePoids
//
//  Created by didier cassanhol on 19/07/2021.
//

import SwiftUI
import SwiftUICharts

struct BodyView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.4), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                Spacer(minLength: 0)
                
                ZStack {
                    Color.white.opacity(0.35)
                        .frame(width: 350, height: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                    
                    //Text("Graphic")
                 // Taux d’évolution = (valeur final - valeur initiale)/valeur initiale *100
                    // frame = CGSize(width: 180, height: 120)
                    VStack {
                        LineChartView(data: [73,73.2,72.9,72.7,72.3,71,70,70.9,71.5], title: "Poids",  form: CGSize(width: 350, height: 200),rateValue: 25)
                        
                    }.padding()
                    //.frame(width: 400, height: 200)
                
                                // legend is optional, use optional
                }
                
                Spacer(minLength: 20)
                
                ZStack {
                    Color.white.opacity(0.35)
                        .frame(width: 300, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                    
                    Text("Jauge")
                }
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
