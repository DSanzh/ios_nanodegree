//
//  RollViewController.swift
//  Dice_Quiz
//
//  Created by Sanzhar on 6/13/17.
//  Copyright © 2017 Sanzhar D. All rights reserved.
//

import UIKit

class RollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func randomDiceValue() -> Int {
        let randomValue = 1 + arc4random() % 6
        return Int(randomValue)
    }
    
    @IBAction func rollTheDice() {
        performSegue(withIdentifier: "rollDice", sender: self)
    }
    
    
}

