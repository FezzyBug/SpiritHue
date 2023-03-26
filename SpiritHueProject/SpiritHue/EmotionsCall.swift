//
//  EmotionsCall.swift
//  SpiritHue
//
//  Created by Jozef Vargas on 3/25/23.
//

import Foundation

func fetchEmotion(text: String, completion: @escaping (String?, Error?) -> Void) {
    // Define the URL and request
    guard let url = URL(string: "https://api-inference.huggingface.co/models/bhadresh-savani/distilbert-base-uncased-emotion") else {
        completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("Bearer YOUR_READ_TOKEN_HERE", forHTTPHeaderField: "Authorization")
    
    // Define the JSON payload
    let json: [String: Any] = ["inputs": text]
    let jsonData = try? JSONSerialization.data(withJSONObject: json)
    request.httpBody = jsonData
    
    // Send the request
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            completion(nil, error)
            return
        }
        // Print the JSON response in a readable format
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print("JSON response:", jsonResult)
                } catch let error {
                    print("Error parsing JSON:", error)
                }
                
                // Parse the response
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let emotionArray = jsonResult["outputs"] as? [String] {
                        let emotion = emotionArray.joined(separator: ", ")
                        completion(emotion, nil)
                    }
                } catch let error {
                    completion(nil, error)
                }
            }
            
            task.resume()
        
}
