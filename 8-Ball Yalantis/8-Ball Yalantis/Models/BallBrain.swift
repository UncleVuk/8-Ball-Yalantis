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
        setAnswer()
        // Return processed answer
        return answer ?? "Error"
    }
    
    
    
    // Set answer text from internet or local file
    mutating func setAnswer() {
        // Set label text to random hardcoded answer
        answer = answersHardcoded.randomElement()
    }
    
    // Array for hardcoded answers
    let answersHardcoded = ["Yes",
                            "No",
                            "No doubt about it",
                            "Absolutely",
                            "The stars say no",
                            "So it shall be",
                            "Unlikely",
                            "Indications say yes",
                            "Positively",
                            "You can count on it",
                            "Answer unclear ask later",
                            "Don't bet on it",
                            "Looks like yes",
                            "Chance aren't good",
                            "Focus and ask again",
                            "Can't say now",
                            "Prospect good",
                            "Very likely",
                            "Consult me later",
                            "Cannot foretell now",
                            "We will be asking questions"]
    
}
