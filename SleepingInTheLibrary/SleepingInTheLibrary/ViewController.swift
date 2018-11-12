//
//  ViewController.swift
//  SleepingInTheLibrary
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var grabImageButton: UIButton!
    
    let parametersDictionary = [Constants.FlickrParameterKeys.APIKey: Constants.FlickrParameterValues.APIKey,
                                Constants.FlickrParameterKeys.Extras: Constants.FlickrParameterValues.MediumURL,
                                Constants.FlickrParameterKeys.Format: Constants.FlickrParameterValues.ResponseFormat,
                                Constants.FlickrParameterKeys.GalleryID: Constants.FlickrParameterValues.GalleryID,
                                Constants.FlickrParameterKeys.Method: Constants.FlickrParameterValues.GalleryPhotosMethod,
                                Constants.FlickrParameterKeys.NoJSONCallback: Constants.FlickrParameterValues.DisableJSONCallback]
    
    // MARK: Actions
    
    @IBAction func grabNewImage(_ sender: AnyObject) {
        setUIEnabled(false)
        getImageFromFlickr()
        
        let baseURL:String = "https://api.flickr.com/services/rest/?"
        let urlParams:String = getURLFromDict(dict: parametersDictionary)
        //let url = URL(baseURL + urlParams)
        
        let url = URL(string: "\(baseURL+urlParams)")
        
        var lstPics = [Photo]()
        
        let jsonTask = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            
            if (error == nil)
            {
                let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
            
                let dictPhotos = json[Constants.FlickrResponseKeys.Photos] as! [String: Any]
                
                for item in dictPhotos[Constants.FlickrResponseKeys.Photo] as! [Any] {
                    let pic = item as! [String:Any]
                    let Title = pic[Constants.FlickrResponseKeys.Title] as! String
                    let ImageURL = pic[Constants.FlickrResponseKeys.MediumURL] as! String
                    
                    lstPics.append(Photo(Title: Title, ImageURL: ImageURL))
                }
                
                DispatchQueue.main.async {
                    
                    //let limit:Int = 0...(lstPics.count - 1)
                    //let rand = Int(arc4random_uniform(limit))
                    
                    let index = Int(arc4random_uniform(UInt32(lstPics.count)))
                    
                    let imageURL = URL(string: lstPics[index].ImageURL)
                    
                    let task = URLSession.shared.dataTask(with: imageURL!) {
                        (data, response, error) in
                        
                        if (error == nil)
                        {
                            DispatchQueue.main.async {
                                self.photoTitleLabel.text = lstPics[index].Title
                                self.photoImageView.image = UIImage(data: data!)
                            }
                        }
                    }
                    task.resume()
                    
                    //self.photoTitleLabel.text = lstPics[index].Title
                }
            }
            DispatchQueue.main.async {
                self.setUIEnabled(true)
            }
        }
        
        jsonTask.resume()
        
        
    }
    
    func getURLFromDict(dict:[String:String]) -> String{
        var params:[String] = []
        
        for (key, value) in dict {
            params.append("\(key)=\(value)")
        }
        
        return params.joined(separator:"&")
    }
    // MARK: Configure UI
    
    private func setUIEnabled(_ enabled: Bool) {
        photoTitleLabel.isEnabled = enabled
        grabImageButton.isEnabled = enabled
        
        if enabled {
            grabImageButton.alpha = 1.0
        } else {
            grabImageButton.alpha = 0.5
        }
    }
    
    // MARK: Make Network Request
    
    private func getImageFromFlickr() {
        
        // TODO: Write the network code here!
    }
}
