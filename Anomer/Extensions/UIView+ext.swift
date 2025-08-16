//
//  UIView+ext.swift
//  Anomer
//
//  Created by Рафаэль Голубев on 16.08.2025.
//

import UIKit

// MARK: - Accessibility
extension UIView {
    @discardableResult
    func setAccessibilityLabel(to label: String) -> String {
        self.accessibilityLabel = label
        return label
    }
    
    @discardableResult
    func getAccessibilityLabel(default label: String) -> String {
        if self.accessibilityLabel == nil {
            return label
        }
        return self.accessibilityLabel!
    }
}

// MARK: - Custom inits
extension UIView {
    convenience init(label: String) {
        self.init()
        self.setAccessibilityLabel(to: label)
    }
}
