//
//  ViewController.swift
//  SocialApp
//
//  Created by AamirNakhwa on 11/14/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var posts = [Post]()
    
    @IBOutlet weak var tableViewPost: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewPost.delegate = self
        tableViewPost.dataSource = self
        
        let jsonURL = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        let jsonTask = URLSession.shared.dataTask(with: jsonURL!) {
            (data, response, error) in
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [Any]
            for item in json{
                let post = item as! [String:Any]
                let id = post["id"] as! Int
                let title = post["title"] as! String
                let userId = post["userId"] as! Int
                let body = post["body"] as! String
                
                self.posts.append(Post(id: id, title: title, userId: userId, body: body))
            }
            self.tableViewPost.reloadData()
        }
        
        jsonTask.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(120)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        
        let currentCell = tableView.cellForRow(at: indexPath) as! PostCellTableViewCell
        
        self.performSegue(withIdentifier: "Comments", sender: Int(currentCell.lblID.text!))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Comments"
        {
            let dest = segue.destination as! CommentsViewController
            dest.PostId = sender as! Int
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCellTableViewCell
        cell.lblID.text = "\(posts[indexPath.row].id)"
        cell.lblUser.text = "\(posts[indexPath.row].userId)"
        cell.lblTitle.text = posts[indexPath.row].title
        cell.lblBody.text = posts[indexPath.row].body
        return cell
    }
    
}

