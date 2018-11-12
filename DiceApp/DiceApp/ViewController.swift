//
//  ViewController.swift
//  DiceApp
//
//  Created by AamirNakhwa on 11/12/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnRoll(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Roll")
        {
            let dest = segue.destination as! RollViewController
            dest.numbers = (1 + Int(arc4random_uniform(6)), 1 + Int(arc4random_uniform(6)))
            
        }
    }
}

