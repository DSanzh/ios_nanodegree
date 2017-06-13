//
//  RoshamboResultViewController.swift
//  Roshambo
//
//  Created by Sanzhar on 6/13/17.
//  Copyright © 2017 Sanzhar D. All rights reserved.
//

import UIKit

class RoshamboResultViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var resultImageString: String!
    var resultLabelText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("resultImageString = \(resultImageString)")
        if let img = resultImageString {
            resultImage.image = UIImage(named: img)
        } else {
            resultImage.image = UIImage()
        }
        
        if let text = resultLabelText {
            resultLabel.text = text
        } else {
            resultLabel.text = ""
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func backToView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
