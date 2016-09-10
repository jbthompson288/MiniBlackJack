//
//  Card.swift
//  MiniBlackJack
//
//  Created by JB Thompson on 9/10/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import Foundation

class Card {
    
    let value: String
    let imageEndpoint: String
    var intValue: Int {
        switch value {
        case "ACE":
            return 14
        case "KING":
            return 13
        case "QUEEN":
            return 12
        case "JACK":
            return 11
        default:
            return Int(value)!
        }
    }
    
    init(valueFromInput: String, imageEndpointFromInput: String) {
        self.value = valueFromInput
        self.imageEndpoint = imageEndpointFromInput
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let valueFromDictionary = dictionary["value"] as? String, let imageEndpointFromDictionary = dictionary["image"] as? String else
        {return nil}
        
        self.value = valueFromDictionary
        self.imageEndpoint = imageEndpointFromDictionary
    }
    
}