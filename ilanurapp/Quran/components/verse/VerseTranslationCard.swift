//
//  VerseTranslationCard.swift
//  ilanurapp
//
//  by Ayman on 10.02.2023.
//

import SwiftUI

struct VerseTranslationCard: View {
    let translation: String
    var body: some View {
        ZStack {
            VStack {
                Text(translation)
                    .foregroundColor(Color("ChapterHeaderForground"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(7)
            }
            .frame(maxWidth: .infinity)
            .background(Color("ChapterHeader"))
            .cornerRadius(4)
        }
    }
}

struct VerseTranslationCard_Previews: PreviewProvider {
    static var previews: some View {
        VerseTranslationCard(translation: "Rahman ve Rahim olan Allah'ın adıyla Rahman ve Rahim olan Allah'ın adıyla Rahman ve Rahim olan Allah'ın adıyla")
    }
}
