//
//  NewTaskViewController.swift
//  SimpleToDo
//
//  Created by AamirNakhwa on 11/13/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {


let delegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var txtNewTask: UITextField!
    
    var TaskIndex:Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let i = TaskIndex
        {
            txtNewTask.text = delegate.TaskList[i]
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSave(_ sender: Any) {
        if let i = TaskIndex
        {
            delegate.TaskList[i] = txtNewTask.text!
        }
        else
        {
            delegate.TaskList.append(txtNewTask.text!)
        }
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
