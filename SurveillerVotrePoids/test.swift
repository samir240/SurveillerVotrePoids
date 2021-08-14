//
//  test.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 13/08/2021.
//

import SwiftUI


struct test: View {
    @State var goWhenTrue: Bool = false
    var body: some View {
        NavigationView {
            VStack{
            Text("Primary View")
            /// 2
            NavigationLink("Navigator",
                           destination: Text("Subsequent View"),
                           isActive: $goWhenTrue)
        
        
        Button("Go Now") {
            /// 3
            goWhenTrue = false
    }
            }
        }
}
}
/// 1

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
