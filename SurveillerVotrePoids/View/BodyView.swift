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
                
                Spacer(minLength: 10)
                
                ZStack {
                    Color.white.opacity(0.35)
                        .frame(width: 350, height: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                    VStack{
                        HStack(alignment: .center, spacing: 10){
                        Image(systemName: "p.circle")
                        .resizable() .frame(width: 45, height: 45)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                        Text("POIDS")
                            Spacer()
                            Text("73.2 kg")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                        }.frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        HStack(alignment: .center, spacing: 10){
                            Image(systemName: "i.circle")
                            .resizable() .frame(width: 45, height: 45)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            Text("IMC")
                            Spacer()
                            Text("20.2")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }.frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        HStack(alignment: .center, spacing: 10){
                            Image(systemName: "f.circle")
                            .resizable() .frame(width: 45, height: 45)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            Text("FCM")
                            Spacer()
                            Text("190")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                        }.frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.padding()
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
