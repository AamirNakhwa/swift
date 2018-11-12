//
//  ViewController.swift
//  memeApp
//
//  Created by Axiom HK 25 on 08/07/2018.
//  Copyright © 2018 Axiom HK 25. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet var btnCapturePic: [UIToolbar]!
    @IBOutlet weak var txtBottom: UITextField!
    @IBOutlet weak var txtTop: UITextField!
    
    let attributes : [String:Any] = [
        NSAttributedStringKey.font.rawValue: UIFont(name: "HelveticaNeue-CondensedBlack", size: 30)!,
        NSAttributedStringKey.strokeColor.rawValue: UIColor.blue
    ]
    
    @IBAction func btnCaptPic(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func btnAddImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.image.image = image
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTop.defaultTextAttributes = attributes
        txtBottom.defaultTextAttributes = attributes
        txtTop.textAlignment = .center
        txtBottom.textAlignment = .center
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func takeScreenShot() -> UIImage {
        toolBar.isHidden = true
        UIGraphicsBeginImageContext(view.frame.size)
        view.drawHierarchy(in: view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        toolBar.isHidden = false
        return memedImage
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMemed"{
            let Destination = segue.destination as! MemedViewController
Destination.memedImage = takeScreenShot()
        }
    }
}

