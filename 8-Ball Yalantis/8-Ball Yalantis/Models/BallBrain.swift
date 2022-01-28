//
//  BallBrain.swift
//  8-Ball Yalantis
//
//  Created by Yevhenii Vuksta on 20.01.2022.
//

import Foundation

struct BallBrain {
    
    // Variable for answer
    var answer: String?
    // Constatnt for url to get answer from
    let answerURL = "https://8ball.delegator.com/magic/JSON/Question"
    
    // Function to return answer string
    mutating func getAnswer() -> String {
        // Function to get answer text
        getAnswerText()
        // Return processed answer
        return answer ?? "Error"
    }
    
    // Set answer text from internet or local file
    mutating func getAnswerText() {
        //getAnswerOnline()
        getAnswerLocal()
    }
    
    // Function to try get answer from web, using url address
    mutating func getAnswerOnline() {
        // Constatnt for url
        if let url = URL(string: answerURL) {
            // Create url session
            let session = URLSession(configuration: .default)
            // Give session a task and process it by using closure
            let task = session.dataTask(with: url) { data, response, error in
                
                // check if there is an error
                if error != nil {
                    // If there is error - print it to console and exit function
                    print(error!)
                    return
                }
                
                // If there is no error - process data
                if let checkData = data {
                    // Run parse JSON func, if data is not nil
                    // parseJSON(inputData: checkData)
                }
            }
            // Start task
            task.resume()
        }
    }
    
    // Function to parse JSON
    mutating func parseJSON(inputData: Data) {
        // Create JSON decoder instance
        let decoder = JSONDecoder()
        // do - try - catch block for decoder's decode function
        do {
            let decodedData = try decoder.decode(AnswerWeb.self, from: inputData)
            // answer = decodedData.magic.answer
            // if there is an error - print it to console
        } catch {
            print(error)
        }
    }
    
    // If there is connection problems - get answer from local answer list singleton
    mutating func getAnswerLocal() {
        // Set answer text to random hardcoded answer
        answer = AnswerList.shared.answers.randomElement()
        
    }
}
