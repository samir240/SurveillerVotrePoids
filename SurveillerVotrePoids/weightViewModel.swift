//
//  weightViewModel.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 06/08/2021.
//

import Foundation
import FirebaseDatabase

class weightViewModel: ObservableObject {
    
    var ref: DatabaseReference = Database.database().reference()
    
    func fetchData() ->Int{
        ref.child("users/CxiKuzuE4zUEPs3iYkoEKV6bnZj1").getData { (error, snapshot) in
                    if let error = error {
                        print("Error getting data \(error)")
                    }
                    else if snapshot.exists() {
                        print("Got data \(snapshot.value!)")
                        print(snapshot.childrenCount)
                        
                        let dict = snapshot.value as! [String: Any]
                        print(dict["long"])
            
                    }
                    else {
                        print("No data available")
                    }
                    
                }
              print("apriiiiii")
        return 1
            }
                    
                }

    
