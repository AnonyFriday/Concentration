//
//  UILabel.swift
//  Concentration
//
//  Created by Vu Kim Duy on 16/1/21.
//

import UIKit

extension UILabel {
    func applyAttributedLabelText(string: String) {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.systemBackground
        shadow.shadowBlurRadius = 5
        
        let attributes : [NSMutableAttributedString.Key: Any] =
            [
                .foregroundColor : UIColor.label,
                .shadow          : shadow,
            ]
        let attributedLabelText = NSMutableAttributedString(string: string, attributes: attributes)
        self.attributedText = attributedLabelText
    }
}
