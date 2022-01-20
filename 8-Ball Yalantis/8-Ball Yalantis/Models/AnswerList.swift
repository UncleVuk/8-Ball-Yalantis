//
//  AnswerList.swift
//  8-Ball Yalantis
//
//  Created by Yevhenii Vuksta on 20.01.2022.
//

import Foundation

struct AnswerList {
    
    // Singletone for answer list
    static var shared: AnswerList = {
        var instance = AnswerList()
        instance.readList()
        return instance
    }()
    
    // Array of string for answers
    var answers: [String] = []
    
    // Function to add new item to array
    mutating func addItem(item: String?) {
        // Make sure item is not nil
        if let itemCheck = item {
            answers.append(itemCheck)
        }
    }
    
    // Function to read answers from file to array
    mutating func readList() {
        // Make sure file is not nil
        if let answersCheck = UserDefaults.standard.array(forKey: "AnswersKey") as? [String] {
            answers = answersCheck
            // ELse if there is no file - set default answer array
        } else {
            answers = ["Yes",
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
    }
    
    // Function to save array to file
    mutating func writeList() {
        // save answer list to file
        UserDefaults.standard.set(answers, forKey: "AnswersKey")
        UserDefaults.standard.synchronize()
    }
}
