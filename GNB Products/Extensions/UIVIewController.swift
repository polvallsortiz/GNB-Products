//
//  UIVIewController.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 24/1/21.
//

import Foundation
import UIKit

extension UIViewController {
    func setupNavigationMultilineTitle(title : String, subtitle : String) {
        let upperTitle = NSMutableAttributedString(string: "\(title)")
        let lowerTitle = NSMutableAttributedString(string: "\n\(subtitle)")

        upperTitle.append(lowerTitle)

        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height:44))
        label1.numberOfLines = 0
        label1.textAlignment = .center
        label1.attributedText = upperTitle  //assign it to attributedText instead of text
        self.navigationItem.titleView = label1
    }
}
