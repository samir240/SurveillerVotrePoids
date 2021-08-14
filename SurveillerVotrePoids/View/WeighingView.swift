//
//  WeighingView.swift
//  SurveillerVotrePoids
//
//  Created by didier cassanhol on 19/07/2021.
//

import SwiftUI

struct WeighingView: View {
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    
    
    var body: some View {
        ZStack{
        VStack{
            
            Button("Ajouter"){
              
                self.isPresented = true
            }
            List(weight.default) { weight in
                HStack{
                    Image(weight.imageName)
                        .resizable() .frame(width: 100, height: 100)
                   
                   
                    Spacer()
                    VStack(spacing : 10){
                        Text(weight.poids)
                            .font(.largeTitle)
                        Text(weight.dateheure)
                            .font(.footnote)
                    }
                  
                }
            }
        }
            EAlert(isShow: $isPresented, text: $text, onDone: { text in
                print(text)
                
            })
        }
        
    }
}

struct WeighingView_Previews: PreviewProvider {
    static var previews: some View {
        WeighingView()
    }
}
