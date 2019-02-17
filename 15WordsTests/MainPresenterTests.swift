//
//  MainPresenterTests.swift
//  15WordsTests
//
//  Created by Ayoze Pérez Rodríguez on 31.01.19.
//  Copyright © 2019 AyoPrez. All rights reserved.
//

import Foundation
import XCTest
@testable import _5Words

class MainPresenterTests: XCTestCase {
    
    func testGetGoodbyeWordsByEmoji(){
        let mainPresenter = MainPresenter(delegate: MockUIViewController1())
        let result = mainPresenter.getWordsByEmoji(emojiType: EmojiType.Goodbye.rawValue)

        XCTAssertEqual(result, ["spanish": "hola"])
    }

}

class MockUIViewController1: MainPresenterDelegate {
    
    func showWaitingDialog() {

    }

    func closeWaitingDialog() {

    }
}

