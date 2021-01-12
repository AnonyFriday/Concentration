//
//  Int+Ext.swift
//  Concentration
//
//  Created by Vu Kim Duy on 13/1/21.
//

import Foundation


extension Int {
    func arc4Random() -> Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(-self)))
        } else {
            return 0
        }
    }
}
