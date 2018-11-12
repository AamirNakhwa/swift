//
//  ViewController.swift
//  CounterApp
//
//  Created by Axiom16 on 5/27/18.
//  Copyright © 2018 Axiom16. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMin.text = "0"
        txtMax.text = "10"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var txtMax: UITextField!
    @IBAction func btnIncrease(_ sender: Any) {
        if counter < Int(txtMax.text!)!{
         counter += 1
         showCount()
        }
    }
    @IBOutlet weak var txtMin: UITextField!
    @IBAction func btnDecrease(_ sender: Any) {
        if counter > Int(txtMin.text!)!{
         counter -= 1
         showCount()
        }
    }
    func showCount(){
        lblCounter.text = "\(counter)"
    }
}

