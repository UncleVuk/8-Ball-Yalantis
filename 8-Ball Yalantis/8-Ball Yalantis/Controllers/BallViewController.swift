//
//  ViewController.swift
//  8-Ball Yalantis
//
//  Created by Yevhenii Vuksta on 19.01.2022.
//

import UIKit

class BallViewController: UIViewController {
    
    // Create instance of ball brain
    var ballBrain = BallBrain()

    // Link ball label
    @IBOutlet weak var ballLabel: UILabel!
    
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
    
    // Function to work with motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        // If motion is detected
        if motion == .motionShake {
            // Get answer from ball brain
            ballLabel.text = ballBrain.getAnswer()
        }
    }
    
    
    // Settings button
    @IBAction func settingsPressed(_ sender: UIButton) {
        
        // Segue to settings view
        self.performSegue(withIdentifier: "goToSettings", sender: self)
    }

}
