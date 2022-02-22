//
//  ViewController.swift
//  8-Ball Yalantis
//
//  Created by Yevhenii Vuksta on 19.01.2022.
//

import UIKit
import SVProgressHUD

class BallViewController: UIViewController {
    
    // Create instance of ball brain
    let ballBrain = BallBrain()
    
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
    
//    lazy var window: UIWindow? = {
//        return UIApplication.shared.windows.first
//    }()
    
    // Function to work with motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        // If motion is detected
        if motion == .motionShake {
            // Start SVProgressHUD animation
            SVProgressHUD.show(withStatus: "Thinking...")
            // Get answer from ball brain instance
            ballBrain.getAnswerText { [weak self] answer in
                DispatchQueue.main.async {
                    self?.ballLabel.text = answer
                    // End SVProgressHUD animation
                    SVProgressHUD.dismiss()
                }
            }
        }
    }
    
    @IBAction func settingsPressed(_ sender: UIButton) {
        // Go to settings view
        performSegue(withIdentifier: "goToSettings", sender: self)
    }
    
}
