//
//  Question.swift
//  BinaryQuiz
//
//  Created by Brennan Colberg on 10/22/18.
//  Copyright © 2018 Brennan Colberg. All rights reserved.
//

import Foundation

public class Question {
    
    
    // MARK: Properties
    
    public private(set) var text: String
    public private(set) var options: [String]
    private var correct: String
    
    
    // MARK: Initialization
    
    init?(options: [String], text: String, correct: String) {
        
        // there must be two options
        guard options.count == 2 else {
            return nil
        }
        
        // each option must be substantial
        guard !options[0].isEmpty && !options[1].isEmpty else {
            return nil
        }
        
        // text must be substantial
        guard !text.isEmpty else {
            return nil
        }
        
        // ensures valid answer
        guard !correct.isEmpty, options.contains(correct) else {
            return nil
        }
        
        // set values
        self.text = text
        self.options = options
        self.correct = correct
        
    }
    
}
