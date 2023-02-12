//
//  ContentView.swift
//  ilanurapp
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        QuranView(selectedChapter: Quran(id: 0, name: "", transliteration: "", type: "", total_verses: 0, verses: [Verse(id: 0, text: "", translation: "")]), showSheet: false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// .font(.custom("QCF2\(String(format: "%03d", info.v2_page))", size: 25))
// .multilineTextAlignment(.trailing)
