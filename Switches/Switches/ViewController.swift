//
//  ViewController.swift
//  Switches
//
//  Created by AamirNakhwa on 11/12/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchRed: UISwitch!
    @IBOutlet weak var switchGreen: UISwitch!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var switchBlue: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showColor(_ sender: Any) {
        let red = CGFloat(switchRed.isOn ? 1 : 0);
        let green = CGFloat(switchGreen.isOn ? 1 : 0);
        let blue = CGFloat(switchBlue.isOn ? 1 : 0);
        
        viewColor.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
    
}

