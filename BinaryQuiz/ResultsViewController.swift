//
//  ResultsViewController.swift
//  BinaryQuiz
//
//  Created by Brennan Colberg on 10/23/18.
//  Copyright © 2018 Brennan Colberg. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var quizTitle : String?
    var score : Int?
    var possible : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // quiz title
        if let quizTitle = quizTitle {
            titleLabel.text = quizTitle
        }
        
        // score message
        if let score = score, let possible = possible {
            let percentage = Int(Double(score) / Double(possible) * 100)
            scoreLabel.text = "\(score)/\(possible) (\(percentage)%)"
        }
        
    }
    
}
