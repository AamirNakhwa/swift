//
//  ViewController.swift
//  NetworkCallForImage
//
//  Created by Axiom HK 15 on 05/08/2018.
//  Copyright © 2018 Axiom HK 15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPicFromInternet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var posts = [Post]()
        
        let url:URL = URL(string: "https://as1.ftcdn.net/jpg/00/04/27/32/500_F_4273258_JDoK0qAlP5aNRIq1OBTmcKyzxPLery00.jpg")!
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if (error == nil)
            {
                DispatchQueue.main.async {
                    self.imgPicFromInternet.image = UIImage(data: data!)
                }
            }
        }
        
        task.resume()
    
        //Json
        
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
                
                posts.append(Post(id: id, title: title, userId: userId, body: body))
            }
            print(posts)
        }
        
        jsonTask.resume()

        }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

