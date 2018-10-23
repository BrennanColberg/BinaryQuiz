//
//  ViewController.swift
//  BinaryQuiz
//
//  Created by Brennan Colberg on 10/19/18.
//  Copyright © 2018 Brennan Colberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    // UI element linkages
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    // specific game properties
    var quizzes = [Quiz]()
    var currentQuiz: Quiz!
    var manager: QuizManager?
    var clickable: Bool = true;
    
    // MARK: System Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load quiz
        manager = QuizManager()
        loadQuestion(manager!.currentQuestion!)
    }

    
    // MARK: Interaction Functions
    
    @IBAction func clickTopButton(_ sender: Any) {
        if (clickable) {
            evaluateGuess(guess: topButton.currentTitle!)
        }
    }
    
    @IBAction func clickBottomButton(_ sender: Any) {
        if (clickable) {
            evaluateGuess(guess: bottomButton.currentTitle!)
        }
    }
    
    
    // MARK: Custom Functions
    
    func loadQuestion(_ question: Question) {
        itemLabel.text = question.text
        topButton.setTitle(question.options[0], for: .normal)
        bottomButton.setTitle(question.options[1], for: .normal)
    }
    
    func evaluateGuess(guess: String) {
        clickable = false;
        if let question = manager?.currentQuestion {
            if (question.isCorrect(guess)) {
                itemLabel.textColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1.0)
                print("correct")
            } else {
                itemLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0)
                print("incorrect")
            }
            
        }
        // then change
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // change 2 to desired number of seconds
            self.itemLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
            self.nextQuestion()
            self.clickable = true;
        }
    }
    
    func nextQuestion() {
        if (manager?.currentQuiz.nextQuestion())! {
            if let question = manager!.currentQuestion {
                loadQuestion(question)
            }
        } else {
            endGame()
        }
    }
    
    func endGame() {
        print("game over!")
    }
    
}

