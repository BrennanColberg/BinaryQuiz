//
//  MenuViewController.swift
//  BinaryQuiz
//
//  Created by Brennan Colberg on 10/23/18.
//  Copyright © 2018 Brennan Colberg. All rights reserved.
//

import Foundation
import UIKit

class MenuTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var quizzes = [Quiz]()
    
    
    // MARK: Initialization
    
    override func viewWillAppear(_ animated: Bool) {
        loadGamesIntoMenu()
    }
    
    private func loadGamesIntoMenu() {
        
        // links to plist
        if let URL = Bundle.main.url(forResource: "Quizzes", withExtension: "plist") {
            // gets array of all quizzes
            if let allQuizArray = NSArray(contentsOf: URL) as? [[String:NSObject]] {
                // loads each quiz (stored as dictionary)
                for quizDict in allQuizArray {
                    // unwraps variables, creates quiz
                    let options = quizDict["Options"] as? [String]
                    let questions = quizDict["Questions"] as? [String:Int]
                    if let newQuiz = Quiz(options: options!, questions: questions!) {
                        // add quiz to menu
                        quizzes.append(newQuiz)
                    }
                }
            }
        }
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // gets the cell prototype
        let cellIdentifier = "MenuTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MenuTableViewCell else {
            fatalError("The dequeued cell is not an instance of MenuTableViewCell.")
        }
        
        // gets quiz data, puts it into cell
        let quiz = quizzes[indexPath.row]
        cell.titleLabel.text = quiz.title
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("should run \(quizzes[indexPath.row].title)")
        self.performSegue(withIdentifier: "PlayGameSegue", sender: self)
    }
    
    
    // MARK: Playing a Game
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let quiz = quizzes[indexPath.row]
            let game = segue.destination as! GameViewController
            game.quiz = quiz
        }
    }
    
}
