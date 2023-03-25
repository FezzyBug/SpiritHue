//
//  DataParser.swift
//  SpiritHue
//
//  Created by Jozef Vargas on 3/24/23.
//

import Foundation

struct EmotionPayload: Codable {
    let text: String
}

//Resposible for encoding the text passed in from the emotionsTextBox.text field and formatting it as a JSON file.
class DataParser {
    func createPayload(from text: String) -> Data? {
        let payload = EmotionPayload(text: text)
        let encoder = JSONEncoder()
        return try? encoder.encode(payload)
    }
}

