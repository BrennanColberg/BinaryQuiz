//
//  ViewController.swift
//  BinaryQuiz
//
//  Created by Brennan Colberg on 10/19/18.
//  Copyright © 2018 Brennan Colberg. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    // MARK: Properties
    
    // UI element linkages
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    // specific game properties
    var quiz: Quiz!
    var clickable: Bool = true;
    
    
    // MARK: System Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion(quiz.currentQuestion!)
    }
    
    
    // MARK: Interaction Functions
    
    @IBAction func tapTopButton(_ sender: Any) {
        if (clickable) {
            evaluateGuess(guess: topButton.currentTitle!)
        }
    }
    
    @IBAction func tapBottomButton(_ sender: Any) {
        if (clickable) {
            evaluateGuess(guess: bottomButton.currentTitle!)
        }
    }
    
    @IBAction func tapExitButton(_ sender: Any) {
        endGame()
    }
    
    
    // MARK: Custom Functions
    
    func loadQuestion(_ question: Question) {
        itemLabel.text = question.text
        topButton.setTitle(question.options[0], for: .normal)
        bottomButton.setTitle(question.options[1], for: .normal)
    }
    
    func nextQuestion() {
        if (quiz.nextQuestion()) {
            if let question = quiz.currentQuestion {
                loadQuestion(question)
            }
        } else {
            endGame()
        }
    }
    
    func evaluateGuess(guess: String) {
        
        // disable additional guesses for this question
        clickable = false;
        
        // evaluate the guess
        if let question = quiz.currentQuestion {
            if (question.isCorrect(guess)) {
                // turn label green if correct
                itemLabel.textColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1.0)
                print("correct")
            } else {
                // turn label red if incorrect
                itemLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0)
                print("incorrect")
            }
            
        }
        
        // change colors back to default & go to next question after 0.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.itemLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
            self.nextQuestion()
            self.clickable = true;
        }
        
    }
    
    func endGame() {
        print("game over!")
        // move to results screen!
        self.performSegue(withIdentifier: "EndGameSegue", sender: nil)
    }
    
}
