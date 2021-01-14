//
//  UIButton+Ext.swift
//  Concentration
//
//  Created by Vu Kim Duy on 14/1/21.
//

import UIKit


extension UIButton {
    func setButtonState(backgroundColor: UIColor?,
                        title: String?, for state: UIControl.State,
                        isEnabled: Bool) {
        
        self.backgroundColor    = backgroundColor
        self.setTitle(title, for: state)
        self.isEnabled          = isEnabled
    }
}
