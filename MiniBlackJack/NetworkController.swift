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
    
    static func dataAtURL(_ urlString: String, completion: @escaping (_ data: Data?) -> Void) {
        guard let url = URL(string: urlString) else { completion(nil); return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (dataFromURL, _, error) in
            if let error = error {
                print(error)
                print(error.localizedDescription)
                completion(nil)
                return
            }
            completion(dataFromURL)
        }) 
        task.resume()
    }
    
    static func jsonFromData(_ data: Data) -> [String: AnyObject]? {
        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject]
        return json ?? nil
    }
    
    static func imageForURL(_ urlString: String, completion: @escaping (_ image: UIImage?) -> Void) {
        //Take URL
        //Get Data from URL
        //Get Image from Data
        NetworkController.dataAtURL(urlString) { (data) in
            guard let data = data else { completion(nil); return }
            let image = UIImage(data: data)
            
            //we have an image
            //put image on the main queue
            //pass up the image
            DispatchQueue.main.async(execute: { 
                completion(image)
            })
            
        }
        
    }
}
