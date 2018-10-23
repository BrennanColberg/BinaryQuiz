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
    
    
    // MARK: Initialization
    
    init?(text: String, options: [String]) {
        
        // text must be substantial
        guard !text.isEmpty else {
            return nil
        }
        
        // there must be two options
        guard options.count == 2 else {
            return nil
        }
        
        // each option must be substantial
        guard !options[0].isEmpty && !options[1].isEmpty else {
            return nil
        }
        
        // set values
        self.text = text
        self.options = options
        
    }
    
}