//
//  ViewController.swift
//  SimpleToDo
//
//  Created by AamirNakhwa on 11/13/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.TaskList.count
    }
    @IBOutlet weak var TasktableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Task")
        //cell.detailTextLabel?.text =
        cell.textLabel?.text = delegate.TaskList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            delegate.TaskList.remove(at: indexPath.row)
            TasktableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NewTask", sender: indexPath.row)
    }

    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewTask"
        {
            let dest = segue.destination as! NewTaskViewController
            dest.TaskIndex = sender as? Int
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print(delegate.TaskList)
        TasktableView.delegate = self
        TasktableView.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func viewWillAppear(_ animated: Bool) {
        TasktableView.reloadData()
        print(delegate.TaskList)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

