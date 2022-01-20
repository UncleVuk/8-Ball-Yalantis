//
//  ViewController.swift
//  8-Ball Yalantis
//
//  Created by Yevhenii Vuksta on 19.01.2022.
//

import UIKit

class BallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Settings button
    @IBAction func settingsPressed(_ sender: UIButton) {
        
        // Segue to settings view
        self.performSegue(withIdentifier: "goToSettings", sender: self)
    }
    
    

}



/*

import UIKit

class ViewController: UIViewController {
    
    // Link magic ball label
    @IBOutlet weak var answerTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder() // To get phone shake motion
    }
    
    // Become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // function to workwith motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        // If motion is detected
        if motion == .motionShake {
            // Set answer from list
            setAnswer()
        }
    }
    
    // Set answer from string
    func setAnswer(answer: String) {
        // Set label text to answer string
        answerTextLabel.text = answer
    }
    
    // Set answer from hardcoded array of strings
    func setAnswer() {
        // Set label text to random hardcoded answer
        answerTextLabel.text = answersHardcoded.randomElement()
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

*/
