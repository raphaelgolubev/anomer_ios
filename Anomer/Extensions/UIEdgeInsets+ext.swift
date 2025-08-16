//
//  UIEdgeInsets+ext.swift
//  Anomer
//
//  Created by Рафаэль Голубев on 16.08.2025.
//

import UIKit

extension UIEdgeInsets {
    static func all(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: value,
            left: value,
            bottom: value,
            right: value
        )
    }
    
    init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }
    init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }
    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }
    init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }
    
    func top(_ value: CGFloat) -> UIEdgeInsets {
        var newInsets = self
        newInsets.top = value
        return newInsets
    }
    
    func right(_ value: CGFloat) -> UIEdgeInsets {
        var newInsets = self
        newInsets.right = value
        return newInsets
    }
    
    func bottom(_ value: CGFloat) -> UIEdgeInsets {
        var newInsets = self
        newInsets.bottom = value
        return newInsets
    }
    
    func left(_ value: CGFloat) -> UIEdgeInsets {
        var newInsets = self
        newInsets.left = value
        return newInsets
    }
    
    func vertical(_ value: CGFloat) -> UIEdgeInsets {
        self
            .top(value)
            .bottom(value)
    }
    
    func horizontal(_ value: CGFloat) -> UIEdgeInsets {
        self
            .left(value)
            .right(value)
    }
}
