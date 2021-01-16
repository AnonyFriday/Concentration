//
//  UILabel.swift
//  Concentration
//
//  Created by Vu Kim Duy on 16/1/21.
//

import UIKit

extension UILabel {
    func applyAttributedLabelText(string: String) {
        let attributes : [NSMutableAttributedString.Key: Any] =
            [
                .backgroundColor : UIColor.systemRed,
                .foregroundColor : UIColor.white
            ]
        let attributedLabelText = NSMutableAttributedString(string: string, attributes: attributes)
        self.attributedText = attributedLabelText
    }
}
