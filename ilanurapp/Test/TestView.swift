//
//  TestView.swift
//  ilanurapp
//
//  by Ayman on 9.02.2023.
//

import SwiftUI

struct TestView: View {
    let allFontNames = UIFont.familyNames
      .flatMap { UIFont.fontNames(forFamilyName: $0) }
    var body: some View {
        List(allFontNames, id: \.self) { name in
            HStack {
                Text(name)
                    .font(Font.custom(name, size: 15))
                Spacer()
                Text("001surah")
                    .font(Font.custom(name, size: 20))
            }
          }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
