//
//  RoshamboResultViewController.swift
//  Roshambo
//
//  Created by Sanzhar on 6/13/17.
//  Copyright © 2017 Sanzhar D. All rights reserved.
//

import UIKit

// MARK: Shape - String

enum Shape: String {
    case Rock = "Rock"
    case Scissors = "Scissors"
    case Paper = "Paper"
    
    static func randomShape() -> Shape {
        let rand = Int(arc4random_uniform(3))
        let shapes = ["Rock", "Paper", "Scissors"]
        return Shape(rawValue: shapes[rand])!
    }
}

// MARK: - RoshamboResultViewController: UIViewController

class RoshamboResultViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Properties
    
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult()
    }
    
    // MARK: Methods
    
    private func displayResult() {
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs \(opponentChoice.rawValue)"
        
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup) It's a Tie"
            imageName = "itsATie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Rock):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You Lose with \(matchup)"
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        imageName = imageName.lowercased()
        print("imagename = \(imageName)")
        print("text = \(text)")
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    
    
    // MARK: Actions
    
    @IBAction func backToView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
