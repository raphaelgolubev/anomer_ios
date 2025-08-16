//
//  NSLayoutConstraint+ext.swift
//  Anomer
//
//  Created by Рафаэль Голубев on 16.08.2025.
//

import UIKit

extension NSLayoutConstraint.Relation {
    var description: String {
        switch self {
        case .equal:
            return "=="
        case .greaterThanOrEqual:
            return ">="
        case .lessThanOrEqual:
            return "<="
        @unknown default:
            fatalError()
        }
    }
}

extension NSLayoutConstraint.Attribute {
    var description: String {
        switch self {
        case .left:
            return "left"
        case .right:
            return "right"
        case .top:
            return "top"
        case .bottom:
            return "bottom"
        case .leading:
            return "leading"
        case .trailing:
            return "trailing"
        case .width:
            return "width"
        case .height:
            return "height"
        case .centerX:
            return "centerX"
        case .centerY:
            return "centerY"
        case .lastBaseline:
            return "lastBaseline"
        case .firstBaseline:
            return "firstBaseline"
        case .leftMargin:
            return "leftMargin"
        case .rightMargin:
            return "rightMargin"
        case .topMargin:
            return "topMargin"
        case .bottomMargin:
            return "bottomMargin"
        case .leadingMargin:
            return "leadingMargin"
        case .trailingMargin:
            return "trailingMargin"
        case .centerXWithinMargins:
            return "centerXWithinMargins"
        case .centerYWithinMargins:
            return "centerYWithinMargins"
        case .notAnAttribute:
            return "notAnAttribute"
        @unknown default:
            fatalError()
        }
    }
}

extension Array where Element == NSLayoutConstraint {
    func printConstraints(label: String? = nil) {
        for constraint in self {
            var firstView = (constraint.firstItem as? UIView)?.getAccessibilityLabel(default: "Unknown") ?? "[not a view]"
            var secondView = (constraint.secondItem as? UIView)?.getAccessibilityLabel(default: "Unknown") ?? "[not a view]"
            
            let firstAttribute = constraint.firstAttribute.description
            let secondAttribute = constraint.secondAttribute.description
            let relation = constraint.relation.description
            
            print("\t- \(firstView).\(firstAttribute) \(relation) \(secondView).\(secondAttribute)")
        }
    }
}
