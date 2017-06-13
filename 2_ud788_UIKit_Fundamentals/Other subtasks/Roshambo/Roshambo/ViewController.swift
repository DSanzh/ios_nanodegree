//
//  ViewController.swift
//  Roshambo
//
//  Created by Sanzhar on 6/13/17.
//  Copyright © 2017 Sanzhar D. All rights reserved.
//

import UIKit

// MARK: - ViewControler : UIViewController

class ViewController: UIViewController {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions
    
    @IBAction func rockButton(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "RoshamboResultViewController") as? RoshamboResultViewController {
            vc.userChoice = Shape.Rock
            present(vc, animated: true, completion: nil)
        }
    }

    @IBAction func scissorsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "playRoshambo", sender: sender)
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playRoshambo" {
            if let controller = segue.destination as? RoshamboResultViewController {
                controller.userChoice = getUserChoice(sender as! UIButton)
            }
        }
    }
    
    // MARK: Utilities
    
    private func getUserChoice(_ sender: UIButton) -> Shape {
        let title = sender.title(for: .normal)!
        return Shape(rawValue: title)!
    }
    
}

