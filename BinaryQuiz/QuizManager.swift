//
//  QuizManager.swift
//  BinaryQuiz
//
//  Created by Brennan Colberg on 10/23/18.
//  Copyright © 2018 Brennan Colberg. All rights reserved.
//

import Foundation

public class QuizManager {
    
    // MARK: Properties
    
    var quizzes: [Quiz] = []
    var currentIndex: Int = 0
    var currentQuiz: Quiz {
        get { return quizzes[currentIndex] }
    }
    
    
    // MARK: Inititalization
    
    init?() {
        // links to plist
        if let URL = Bundle.main.url(forResource: "Quizzes", withExtension: "plist") {
            // gets array of all quizzes
            if let allQuizArray = NSArray(contentsOf: URL) as? [[String:NSObject]] {
                // loads each quiz (stored as dictionary)
                for quizDict in allQuizArray {
                    // unwraps variables
                    let options = quizDict["Options"] as? [String]
                    let questions = quizDict["Questions"] as? [String:Int]
                    // creates quiz with variables (force unwrapping is probably bad idea)
                    quizzes.append(Quiz(options: options!, questions: questions!)!)
                }
            }
        }
    }
    
}
