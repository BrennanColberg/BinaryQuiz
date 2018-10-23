//
//  Quiz.swift
//  BinaryQuiz
//
//  Created by Brennan Colberg on 10/22/18.
//  Copyright © 2018 Brennan Colberg. All rights reserved.
//

import Foundation

public class Quiz {
    
    // MARK: Properties
    
    // variables
    var options: [String]
    var questions: [String]
    var answers: [String:Int]
    var index: Int = 0
    
    // getters & setters
    var currentQuestion: Question {
        get {
            let question = questions[index]
            let correct = options[answers[question]!]
            return Question(options: self.options, text: question, correct: correct)!
        }
    }
    
    
    // MARK: Initialization
    
    init?(options: [String], questions: [String:Int]) {
        
        // must be two options
        guard options.count == 2 else {
            return nil;
        }
        
        // must be at least one question
        guard !questions.keys.isEmpty else {
            return nil;
        }
        
        // set values
        self.options = options
        self.answers = questions
        self.questions = Array(self.answers.keys)
        
    }
    
    
    // MARK: Control Methods
    
    // goes to next question
    // returns whether or not the next question exists
    public func nextQuestion() -> Bool {
        index += 1
        return index < questions.count
    }
    
}
