//
//  ChapterCard.swift
//  ilanurapp
//
//  by Ayman on 9.02.2023.
//

import SwiftUI

struct ChapterCard: View {
    let id: Int
    let name: String
    let verseCount: Int
    let place: String
    let arabic: String
    
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                VStack {}
                    .frame(width: 10, height: 10)
                    .padding(10)
                    .background(.brown)
                    .cornerRadius(50)
                Text("\(id)")
                    .foregroundColor(.white)
                    .font(.caption).bold()
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(name)
                    .font(.title3).bold()
                Text("\(verseCount) verses - \(place)")
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.7))
            }
            Spacer()
            Text(arabic)
                .font(.custom("kfgqpchafsuthmanicscript-Reg", size: 25))
                .foregroundColor(.black.opacity(0.9))
            
        }
    }
}

struct ChapterCard_Previews: PreviewProvider {
    static var previews: some View {
        ChapterCard(id: 1, name: "Al-Fätihah", verseCount: 7, place: "meccan", arabic: "الفاتحة")
    }
}
