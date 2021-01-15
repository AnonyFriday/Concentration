//
//  Card.swift
//  Concentration
//
//  Created by Vu Kim Duy on 9/1/21.
//

import Foundation

struct Card : Hashable
{
    var isFadeUp = false
    var isMatch  = false
    private var identifier : Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    private static var countIdentifier = 0
    
    init() {
        self.identifier = Card.getIdentifier()
    }
    
    private static func getIdentifier() -> Int {
        countIdentifier += 1
        return countIdentifier
    }
    
}
