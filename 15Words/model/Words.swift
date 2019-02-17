//
//  Words.swift
//  15Words
//
//  Created by Ayoze Pérez Rodríguez on 07.02.19.
//  Copyright © 2019 AyoPrez. All rights reserved.
//

import Foundation

struct Words: Codable {
    let words: [Word]
}

struct Word: Codable {
    let hello, goodbye: [Countries]?
}

struct Countries: Codable {
    let argentina, corea: Language?
}

struct Language: Codable {
    let word, language: String
}


//struct Emojis {
//    let hello: [Language]?
//    let goodbye: [Language]?
//}

//struct Argentina: Language {
//    var word: String
//    var language: String
//}

//struct Corea: Language {
//    var word: String
//    var language: String
//}
