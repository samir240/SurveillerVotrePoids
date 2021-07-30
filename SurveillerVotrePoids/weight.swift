//
//  weight.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 30/07/2021.
//

import Foundation

struct weight : Identifiable {
    var id = UUID()
    var imageName : String
    var dateheure : String
    var poids : String
    
    static let `default` =  [
    weight(imageName: "1", dateheure: "Le 28/12/2019 à 12:00", poids: "75.20 kg"),
        weight(imageName: "1", dateheure: "Le 21/12/2019 à 12:00", poids: "75.20 kg"),
        weight(imageName: "1", dateheure: "Le 22/12/2019 à 12:00", poids: "75.20 kg"),
        weight(imageName: "1", dateheure: "Le 23/12/2019 à 12:00", poids: "75.20 kg"),
        weight(imageName: "1", dateheure: "Le 24/12/2019 à 12:00", poids: "75.20 kg"),
        weight(imageName: "1", dateheure: "Le 28/12/2019 à 12:00", poids: "75.20 kg"),
        weight(imageName: "1", dateheure: "Le 29/12/2019 à 12:00", poids: "75.20 kg"),
        
    ]
}
