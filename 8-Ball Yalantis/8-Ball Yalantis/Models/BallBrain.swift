//
//  BallBrain.swift
//  8-Ball Yalantis
//
//  Created by Yevhenii Vuksta on 20.01.2022.
//

import Foundation

struct BallBrain {
    
    // https://8ball.delegator.com/magic/JSON/Question
    
    var answer: String?
    
    // Function to return answer string
    mutating func getAnswer() -> String {
        // Function to get answer text
        setAnswerText()
        // Return processed answer
        return answer ?? "Error"
    }
    
    // Set answer text from internet or local file
    mutating func setAnswerText() {
        
        
        // Set label text to random hardcoded answer
        answer = AnswerList.shared.answers.randomElement()
    }
}
