//
//  AnswerWeb.swift
//  8-Ball Yalantis
//
//  Created by Yevhenii Vuksta on 26.01.2022.
//

//{
//  "magic": {
//    "question": "Question",
//    "answer": "Outlook good",
//    "type": "Affirmative"
//  }
//}

// Structs for JSON decode
struct AnswerWeb: Decodable {
    let magic: Magic
}

struct Magic: Decodable {
    let question: String
    let answer: String
    let type: String
}
