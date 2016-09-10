//
//  NetworkController.swift
//  MiniBlackJack
//
//  Created by JB Thompson on 9/10/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import Foundation

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
    
    //Put this in the plist
    /*
    <key>NSAppTransportSecurity</key>
    <dict>
    <!--Include to allow all connections (DANGER)-->
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    </dict>
    */
}