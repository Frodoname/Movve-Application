//
//  UIView + Extension.swift
//  Movve
//
//  Created by Fed on 16.08.2022.
//

import Foundation
import UIKit

extension UIView {
    @discardableResult
    func prepareForAutoLayOut() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
