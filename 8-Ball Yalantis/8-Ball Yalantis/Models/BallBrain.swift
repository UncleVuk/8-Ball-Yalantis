//
//  BallBrain.swift
//  8-Ball Yalantis
//
//  Created by Yevhenii Vuksta on 20.01.2022.
//

import Foundation

class BallBrain {
    // Variable for answer text
    var answer: String? = nil
    
    var answerStr: AnswerWeb? = nil
    
    // Constatnt for url to get answer from
    let answerURL = "https://8ball.delegator.com/magic/JSON/Question"
    
    func returnAnswer() -> String {
        // Return answer text, if everything went wrong and answer is still nil - return Error
        return answerStr?.magic.answer ?? "Error"
    }
    
    // Set answer text from internet or local file and return it to controller
    func getAnswerText() {
        
        print("var created")
        
        // Try to get answer from web
        requestAnswer(urlString: answerURL) { [unowned self] result in
            print("closure start")
            // Process result
            switch result {
                // If there is some result from web - set answer to data from web
            case .success(let answerWeb):
                answer = answerWeb.magic.answer
                print("Closure success")
                
                // If something went wrong - set answer from local array
            case .failure(let error):
                answer = self.getAnswerLocal()
                print("Closure error: \(error)")
            }
        }
        print("request complete")
    }
    
    // Function to request answer from web
    func requestAnswer(urlString: String, completion: @escaping (Result<AnswerWeb, Error> ) -> Void) {
        // Make sure url is correct
        guard let url = URL(string: urlString) else { return }
        
        // Create task as url session
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Start web task ansyncronously
            DispatchQueue.main.async {
                // Check if there is no error
                if let error = error {
                    // If there is error - print it to console and set completion to failure
                    print("URL session error: \(error)")
                    completion(.failure(error))
                    return
                }
                
                // If there is no error - try to process data
                if let dataCheck = data {
                    // do - try - catch block of JSON decoder
                    do {
                        // Decode JSON from web and put it into answers const
                        let answers = try JSONDecoder().decode(AnswerWeb.self, from: dataCheck)
                        self.answerStr = answers
                        // Set completion success as answers
                        completion(.success(answers))
                        // if there is an error - print it to console
                    } catch {
                        // Print error to console
                        print("JSON decoder error: \(error)")
                        // Set completion to failure
                        completion(.failure(error))
                        return
                    }
                } else { return }
            }
        }
        // Start url task
        task.resume()
    }
    
    // If there is problems with getting answer from web - get answer from local answer list singleton
    func getAnswerLocal() -> String? {
        // Set answer text to random hardcoded answer
        return AnswerList.shared.answers.randomElement()
    }
}
