//
//  VerseCard.swift
//  ilanurapp
//
//  by Ayman on 10.02.2023.
//

import SwiftUI

struct VerseCard: View {
    let text: String
    let ayahNumber: Int
    
    var body: some View {
        VStack {
            Text(text)
                .font(.custom("kfgqpchafsuthmanicscript-Reg", size: 20))
          + Text(convertToArabic(number: ayahNumber))
                .font(.custom("kfgqpchafsuthmanicscript-Reg", size: 20))
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
    func convertToArabic(number: Int) -> String {
        let numbersDictionary: [Int: String] = [0: "٠",1: "١",2: "٢",3: "٣",4: "٤",5: "٥",6: "٦",7: "٧",8: "٨",9: "٩"
        ]
        var result = ""
        var number = number
        while number > 0 {
            let digit = number % 10
            result = numbersDictionary[digit]! + result
            number /= 10
        }
        return result
    }
}

struct VerseCard_Previews: PreviewProvider {
    static var previews: some View {
        VerseCard(text: "", ayahNumber: 0)
    }
}
