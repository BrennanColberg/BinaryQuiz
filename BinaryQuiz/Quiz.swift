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
    
    public private(set) var questions: [Question]
    
    
    // MARK: Initialization
    
    init?(questions: [Question]) {
        
        // must be at least one question
        guard !questions.isEmpty else {
            return nil
        }
        
        self.questions = questions
        
    }
    
}
