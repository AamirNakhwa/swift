//
//  RollViewController.swift
//  DiceApp
//
//  Created by AamirNakhwa on 11/12/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit

class RollViewController: UIViewController {

    @IBOutlet weak var imgDice2: UIImageView!
    @IBOutlet weak var imgDice1: UIImageView!
    var numbers:(Int, Int) = (0, 0)
    override func viewDidLoad() {
        super.viewDidLoad()

        print(numbers)
        
        imgDice1.image = UIImage(named: "\(numbers.0).jpeg")
        imgDice2.image = UIImage(named: "\(numbers.1).jpeg")
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTryAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

}
