//
//  VerseView.swift
//  ilanurapp
//
//  by Ayman on 11.02.2023.
//

import SwiftUI

struct VerseView: View {
    @Binding var verse: Quran
    @Environment(\.colorScheme) var colorScheme
    var formattedNumber: String {
        String(format: "%03d", verse.id)
    }

    var body: some View {
        ScrollView {
            VStack {
                ChapterName(chapterName: "\(formattedNumber)surah", AtTawbah: verse.id)
                ForEach(verse.verses, id: \.id) { verse in
                    VerseCard(text: verse.text, ayahNumber: verse.id)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    VerseTranslationCard(translation: verse.translation)
                }
                .listRowSeparator(.hidden)
                .listStyle(.plain)
            }
            .padding()
        }
    }
}


