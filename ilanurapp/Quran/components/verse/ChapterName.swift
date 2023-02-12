//
//  ChapterHeader.swift
//  ilanurapp
//
//  by Ayman on 10.02.2023.
//

import SwiftUI
// _nme
struct ChapterName: View {
    let chapterName: String
    let AtTawbah: Int
    var body: some View {
        VStack(spacing: 30) {
            ZStack {
                VStack {}
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color("ChapterHeader"))
                    .cornerRadius(4)
                    .padding(5)
                
                Text(chapterName)
                    .font(.custom("sura_names", size: 30))
                    .foregroundColor(Color("ChapterHeaderForground"))
            }
            if AtTawbah != 9 {
                Text("﷽")
                    .font(.custom("sura_names", size: 25))
                    .foregroundColor(Color("ChapterHeaderForground"))
            }
        }
    }
}

struct ChapterHeader_Previews: PreviewProvider {
    static var previews: some View {
        ChapterName(chapterName: "001surah", AtTawbah: 1)
            
    }
}
