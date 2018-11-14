//
//  CommentsViewController.swift
//  SocialApp
//
//  Created by AamirNakhwa on 11/14/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    var PostId: Int!
    var comments = [Comment]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommentCell", for: indexPath) as! CommentCollectionViewCell
        
        cell.lblID.text = "\(comments[indexPath.row].id)"
        cell.lblName.text = "\(comments[indexPath.row].user)"
        cell.lblEmail.text = comments[indexPath.row].email
        cell.lblBody.text = comments[indexPath.row].body
        return cell
    }
    

    @IBOutlet weak var collectionViewComments: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(PostId)")
        
        collectionViewComments.delegate = self
        collectionViewComments.dataSource = self
        let jsonURL = URL(string: "https://jsonplaceholder.typicode.com/posts/\(PostId!)/comments")
        
        print("https://jsonplaceholder.typicode.com/posts/\(PostId!)/comments")
        
        let jsonTask = URLSession.shared.dataTask(with: jsonURL!) {
            (data, response, error) in
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [Any]
            for item in json{
                print(item)
                
                let comment = item as! [String:Any]
                let id = comment["id"] as! Int
                let email = comment["email"] as! String
                let user = comment["name"] as! String
                let body = comment["body"] as! String
                let postId = comment["postId"] as! Int
                self.comments.append(Comment(postId: "\(postId)", id: id, email: email, user: user, body: body))
                
                print(self.comments)
            }
            DispatchQueue.main.async {
                self.collectionViewComments.reloadData()
            }
        }
        
        jsonTask.resume()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
