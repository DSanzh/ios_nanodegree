//
//  ViewController.swift
//  Roshambo
//
//  Created by Sanzhar on 6/13/17.
//  Copyright © 2017 Sanzhar D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var result = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rockButton(_ sender: UIButton) {
        makeResult(me: 2)
    }

    @IBAction func scissorsButton(_ sender: UIButton) {
        makeResult(me: 2)
        performSegue(withIdentifier: "playRoshambo", sender: self)
    }
    
    func makeResult(me: Int) {
        let randomValue = arc4random()%3
        if me == 0 {
            if randomValue == 1 {
                result = ["RockCrushesScissors", "Rock crushes the scissors, You Win!"]
            } else if randomValue == 2 {
                result = ["PaperCoversRock", "PaperCoversRock, You Lose!"]
            }
        } else if me == 1 {
            if randomValue == 0 {
                result = ["RockCrushesScissors", "Rock crushes the scissors, You Lose!"]
            } else if randomValue == 2 {
                result = ["ScissorsCutPaper", "ScissorsCutPaper, You Win!"]
            }
        } else if me == 3 {
            if randomValue == 0 {
                result = ["PaperCoversRock", "PaperCoversRock, You Win!"]
            } else if randomValue == 1 {
                result = ["ScissorsCutPaper", "ScissorsCutPaper, You Lose!"]
            }
        }
        
        result = ["itsATie", "It's a Tie"]
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playRoshambo" {
            if let controller = segue.destination as? RoshamboResultViewController {
                if let array = sender as? Array<String> {
                    controller.resultImageString = array[0]
                    controller.resultLabelText = array[1]
                }
            }
        }
    }
    
}

