//
//  MainPresenter.swift
//  15Words
//
//  Created by Ayoze Pérez Rodríguez on 31.01.19.
//  Copyright © 2019 AyoPrez. All rights reserved.
//

import Foundation

enum EmojiType: Int {
    case Beer = 0
    case Goodbye = 1
    case Hello = 2
    case Help = 3
    case How = 4
    case Morning = 5
    case Night = 6
    case No = 7
    case Yes = 8
    case Ok = 9
    case Please = 10
    case Sorry = 11
    case Thanks = 12
    case WC = 13
    case Welcome = 14
}

protocol MainPresenterDelegate {

    func showWaitingDialog()
    func closeWaitingDialog()
}

class MainPresenter {
    
    var delegate: MainPresenterDelegate
    
    init(delegate: MainPresenterDelegate) {
        self.delegate = delegate
    }
    
    func getWordsByEmoji(emojiType: Int) -> Dictionary<String, String> {
        
        switch emojiType {
            case EmojiType.Beer.rawValue:
                return Dictionary.init()
            case EmojiType.Goodbye.rawValue:
                return getGoodbeyWords()
            default:
                return Dictionary.init()
        }
        
    }
    
    private func getGoodbeyWords() -> Dictionary<String, String> {
        
        var goodbyeWords: [String: String] = ["":""]
        
        if let path = Bundle.main.path(forResource: "Words", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                
                let words = try? decoder.decode(Words.self, from: data)
                
                let arg = words?.words[0].hello?[0].argentina
                
                let word = arg?.word ?? ""
                let language = arg?.language ?? ""
                
                goodbyeWords = [language: word]
                
            } catch _ {
                print("Error")
                
                goodbyeWords = ["": ""]
                
                // handle error
            }
        }
        
        return goodbyeWords
    }
    
    
}
