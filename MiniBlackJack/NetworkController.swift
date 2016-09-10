//
//  NetworkController.swift
//  MiniBlackJack
//
//  Created by JB Thompson on 9/10/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    
    static func dataAtURL(urlString: String, completion: (data: NSData?) -> Void) {
        guard let url = NSURL(string: urlString) else { completion(data: nil); return }
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (dataFromURL, _, error) in
            if let error = error {
                print(error)
                print(error.localizedDescription)
                completion(data: nil)
                return
            }
            completion(data: dataFromURL)
        }
        task.resume()
    }
    
    static func jsonFromData(data: NSData) -> [String: AnyObject]? {
        let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject]
        return json ?? nil
    }
    
    static func imageForURL(urlString: String, completion: (image: UIImage?) -> Void) {
        //Take URL
        //Get Data from URL
        //Get Image from Data
        NetworkController.dataAtURL(urlString) { (data) in
            guard let data = data else { completion(image: nil); return }
            let image = UIImage(data: data)
            
            //we have an image
            //put image on the main queue
            //pass up the image
            dispatch_async(dispatch_get_main_queue(), { 
                completion(image: image)
            })
            
        }
        
    }
}