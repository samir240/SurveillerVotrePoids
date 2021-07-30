//
//  EAlert.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 30/07/2021.
//

import SwiftUI

struct EAlert: View {
    let screenSize = UIScreen.main.bounds
    @Binding var isShow: Bool
    @Binding var text: String
    var title: String = "Add weight"
    
    
    //
    var onDone: (String) -> Void = { _ in}
    var onCancel: () -> Void = { }
    //
    
    var body: some View {
        VStack{
            Text(title)
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack{
                Button("Confirmer") {
                    self.isShow = false
                    self.onDone(self.text)
                    
                }
                
                Button("Annuler") {
                    self.isShow = false
                    self.onCancel()
                    
                }
            }
            
            
            
        }.padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
        .background(Color(.systemGray2))
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        //
        .offset(y: isShow ? 0 : screenSize.height)
        .animation(.spring())
        //
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 6, x: -9, y: -9)
        
        
       
    }
}

struct EAlert_Previews: PreviewProvider {
    static var previews: some View {
        EAlert(isShow: .constant(true), text: .constant(""))
    }
}
