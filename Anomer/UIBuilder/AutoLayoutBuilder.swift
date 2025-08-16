//
//  AutoLayoutBuilder.swift
//  Anomer
//
//  Created by Рафаэль Голубев on 08.08.2025.
//

import UIKit

public extension NSLayoutConstraint {
    static func activate(@AutoLayoutBuilder _ constraints: () -> [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(constraints())
    }
}

extension UIView {
    func addSubview(translatesAutoresizingMask: Bool = false, _ subview: UIView, @AutoLayoutBuilder _ constraints: () -> [NSLayoutConstraint]) {
        subview.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMask
        addSubview(subview)
        NSLayoutConstraint.activate(constraints())
    }
}


@resultBuilder
public struct AutoLayoutBuilder {
    /// One or more arrays of constraints
    public static func buildBlock(_ components: [NSLayoutConstraint]...) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }

    /// Add support for both single and collections of constraints. Threre are for single constraint
    public static func buildExpression(_ expression: NSLayoutConstraint) -> [NSLayoutConstraint] {
        [expression]
    }
    /// Add support for both single and collections of constraints. Threre are for collection of constraints
    public static func buildExpression(_ expression: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        expression
    }

    /// Add support for `optionals`.
    public static func buildOptional(_ components: [NSLayoutConstraint]?) -> [NSLayoutConstraint] {
        components ?? []
    }

    /// Add support for `if` statements. There are for first variant
    public static func buildEither(first components: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        components
    }
    /// Add support for `if` statements. There are for second variant
    public static func buildEither(second components: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        components
    }

    /// Add support for `loops`.
    public static func buildArray(_ components: [[NSLayoutConstraint]]) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }

    /// Add support for `#availability` checks.
    public static func buildLimitedAvailability(_ components: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        components
    }
}
