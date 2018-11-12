//
//  MemedViewController.swift
//  memeApp
//
//  Created by Axiom HK 25 on 08/07/2018.
//  Copyright © 2018 Axiom HK 25. All rights reserved.
//

import UIKit

class MemedViewController: UIViewController {

    @IBOutlet weak var memeImage: UIImageView!
    var memedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavBar()
        memeImage.image = memedImage
        // Do any additional setup after loading the view.
    }

    func configureNavBar(){
        let btn = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(btnSave))
        navigationItem.rightBarButtonItem = btn
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func btnSave(){
        UIImageWriteToSavedPhotosAlbum(memedImage, nil, nil, nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
