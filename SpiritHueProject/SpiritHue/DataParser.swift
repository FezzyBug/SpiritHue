//
//  DataParser.swift
//  SpiritHue
//
//  Created by Jozef Vargas on 3/24/23.
//

import Foundation
//
//This code defines a struct named EmotionPayload that conforms to the Codable protocol. The struct has a single property called text of type String. The Codable protocol allows instances of the struct to be encoded and decoded to and from JSON using a JSONEncoder or JSONDecoder.
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


//This code defines a class named DataParser with a single function called createPayload(from:). The function takes a String parameter called text and returns an optional Data object.
//
//Inside the createPayload(from:) function, a new instance of EmotionPayload is created using the provided text. Then, a new instance of JSONEncoder is created, and the payload instance is encoded into a JSON-encoded Data object using the encoder. If the encoding is successful, the Data object is returned. If the encoding fails, the function returns nil.
//
//The purpose of this code is to provide a utility class that can be used to encode a given text as a JSON payload, which can be used to send data to a server or other backend service.
//
