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
    
    
    // MARK: System Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = QuizManager()
    }

    
    // MARK: Interaction Functions
    
    @IBAction func clickTopButton(_ sender: Any) {
        itemLabel.text = "top"
    }
    
    @IBAction func clickBottomButton(_ sender: Any) {
        itemLabel.text = "bottom"
    }
    
    
    // MARK: Custom Functions
    
    func loadQuiz(_ quiz: Quiz) {
        self.currentQuiz = quiz
    }
    
    func loadQuestion(_ question: Question) {
        itemLabel.text = question.text
        topButton.setTitle(question.options[0], for: .normal)
        bottomButton.setTitle(question.options[1], for: .normal)
    }
    
}

