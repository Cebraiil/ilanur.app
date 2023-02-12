//
//  ReadData.swift
//  ilanurapp
//
//  by Ayman on 9.02.2023.
//

import SwiftUI

// Quran Text Code
struct Quran: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case id
        case name
        case transliteration
        case verses
        case type
        case total_verses
    }
    
    var id: Int
    var name: String
    var transliteration: String
    var type: String
    var total_verses: Int
    var verses: [Verse]
}

struct Verse: Codable {
    var id: Int
    var text: String
    var translation: String
}

class ReadData: ObservableObject  {
    @Published var quran = [Quran]()
    init(){
        loadData()
    }
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "quran", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let quran = try? JSONDecoder().decode([Quran].self, from: data!)
        self.quran = quran!
    }
}
