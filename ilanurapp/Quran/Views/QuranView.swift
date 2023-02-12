//
//  QuranView.swift
//  ilanurapp
//
//  by Ayman on 11.02.2023.
//

import SwiftUI

struct QuranView: View {
    // data from JSON
    @ObservedObject var datas = ReadData()
    // selected Chapter
    @State var selectedChapter: Quran
    // sheet view showing
    @State var showSheet: Bool
    // searchabr text value
    @State private var searchText = ""

    @State private var sort: Int = 0

    @State private var showingCredits = false

    var body: some View {
        NavigationView {
            VStack {
                if selectedChapter.id != 0 {
                    VerseView(verse: self.$selectedChapter)
                } else {
                    ProgressView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action:{self.showSheet.toggle()}) {
                Image(systemName: "list.dash")
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingCredits.toggle()
                    } label: {
                        Image(systemName: "house")
                    }
                    .sheet(isPresented: $showingCredits) {
                        Text("This app was brought to you by Hacking with Swift")
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.hidden)
                    }
               }
           }
            .sheet(isPresented: $showSheet) {
                NavigationView {
                    List(searchResults) { info in
                        Button(action: {
                            self.selectedChapter = info
                            self.showSheet.toggle()
                        }) {
                            HStack {
                                ChapterCard(id: info.id, name: info.transliteration, verseCount: info.total_verses, place: info.type, arabic: info.name)
                            }
                        }
                    }
                    .navigationTitle("Content")
                    .navigationBarItems(leading:Button(action:{self.showSheet.toggle()}){Text("Cancel")})
                    .toolbar {
                       ToolbarItem(placement: .primaryAction) {
                           Menu {
                               Picker(selection: $sort, label: Text("Sorting options")) {
                                   Text("Size").tag(0)
                                   Text("Date").tag(1)
                                   Text("Location").tag(2)
                               }
                           }
                           label: {
                               Label("Language", systemImage: "globe")
                           }
                       }
                   }
                }.searchable(text: $searchText)
            }
            .onAppear(perform: loadSelectedChapter)
            .onDisappear(perform: saveSelectedChapter)
        }
    }
    var searchResults: [Quran] {
        if searchText.isEmpty {
          return datas.quran
        } else {
          return datas.quran.filter
            { $0.transliteration.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private func loadSelectedChapter() {
        let selectedChapterId = UserDefaults.standard.integer(forKey: "selectedChapterId")
            selectedChapter = datas.quran.first(where: { $0.id == selectedChapterId }) ?? datas.quran[0]
        if selectedChapter.id == 0 {
            showSheet = true
        } else {
            showSheet = false
        }
    }

    private func saveSelectedChapter() {
        UserDefaults.standard.set(selectedChapter.id, forKey: "selectedChapterId")
    }
}

