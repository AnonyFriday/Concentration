//
//  Card.swift
//  Concentration
//
//  Created by Vu Kim Duy on 9/1/21.
//

import Foundation


struct Card
{
    var isFadeUp = false
    var isMatch  = false
    var identifier : Int
    
    static var countIdentifier = 0
    
    init() {
        self.identifier = Card.getIdentifier()
    }
    
    static func getIdentifier() -> Int {
        countIdentifier += 1
        return countIdentifier
    }
    
}
