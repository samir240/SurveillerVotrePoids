//
//  BarView.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 22/07/2021.
//

import SwiftUI

struct BarView: View {
var value: CGFloat = 0
var week: String = ""
var body: some View {
VStack {
ZStack(alignment: .bottom) {
Capsule().frame(width: 30, height: value)

Capsule().frame(width: 30, height: value)
.foregroundColor(Color(.white))
Capsule().frame(width: 30, height: value)
.foregroundColor(Color(.white))
Capsule().frame(width: 20, height: value)
.foregroundColor(Color(.white))
Capsule().frame(width: 20, height: value)
.foregroundColor(Color(.white))
  }
Text(week)
    }
  }
}
struct BarView_Previews: PreviewProvider {
static var previews: some View {
BarView()
  }
}
