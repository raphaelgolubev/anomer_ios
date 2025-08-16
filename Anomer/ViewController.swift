//
//  ViewController.swift
//  Anomer
//
//  Created by Рафаэль Голубев on 22.07.2025.
//

import UIKit

extension UIView {
    /// Places view to center of `parentView`.
    /// - Parameters:
    ///   - parentView: view on which you want to placing current view.
    ///   - offsetX: a positive value will shift the view to the right, a negative value will shift the view to the left.
    ///   - offsetY: a positive value will shift the view down, a negative value will shift the view up.
    /// - Returns: array of constraints with `centerYAnchor` and `centerXAnchor`.
    /// - Example:
    /// ```swift
    ///  view.addSubview(greetingsLabel) {
    ///     greetingsLabel.center(
    ///         of: view,
    ///         offsetX: 40, // shift 40 points to right
    ///         offsetY: 40  // shift 40 point to down
    ///     )
    ///  }
    /// ```
    /// ```swift
    ///  view.addSubview(greetingsLabel) {
    ///     greetingsLabel.center(
    ///         of: view,
    ///         offsetX: -40, // shift 40 points to left
    ///         offsetY: -40  // shift 40 point to up
    ///     )
    ///  }
    /// ```
    func center(of parentView: UIView, offsetX: CGFloat = 0, offsetY: CGFloat = 0) -> [NSLayoutConstraint] {
        [
            self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: offsetY),
            self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor, constant: offsetX)
        ]
    }
    
    func toCenterX(of parentView: UIView, offsetX: CGFloat = 0) -> NSLayoutConstraint {
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor, constant: offsetX)
    }
    func toCenterY(of parentView: UIView, offsetY: CGFloat = 0) -> NSLayoutConstraint {
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: offsetY)
    }
    
    func size(width: CGFloat, height: CGFloat) -> [NSLayoutConstraint] {
        [
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ]
    }
    
    func square(_ value: CGFloat) -> [NSLayoutConstraint] {
        self.size(width: value, height: value)
    }
    
    func top(equalTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        self.topAnchor.constraint(equalTo: anchor, constant: offset)
    }
    func right(equalTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        self.rightAnchor.constraint(equalTo: anchor, constant: -offset)
    }
    func left(equalTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        self.leftAnchor.constraint(equalTo: anchor, constant: offset)
    }
    func bottom(equalTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        self.bottomAnchor.constraint(equalTo: anchor, constant: -offset)
    }
    
    func trailing(equalTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        self.trailingAnchor.constraint(equalTo: anchor, constant: -offset)
    }
    func leading(equalTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        self.leadingAnchor.constraint(equalTo: anchor, constant: offset)
    }
    
    func pin(to view: UIView, margins: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        return [
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: margins.top),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margins.right),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margins.bottom),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margins.left),
        ]
    }
}

struct Layout {
    var targetView: UIView
    
    init(view: UIView) {
        self.targetView = view
    }
    
    var top: NSLayoutYAxisAnchor { targetView.topAnchor }
    var right: NSLayoutXAxisAnchor { targetView.rightAnchor }
    var bottom: NSLayoutYAxisAnchor { targetView.bottomAnchor }
    var left: NSLayoutXAxisAnchor { targetView.leftAnchor }
    
    var leading: NSLayoutXAxisAnchor { targetView.leadingAnchor }
    var trailing: NSLayoutXAxisAnchor { targetView.trailingAnchor }
    
    var width: NSLayoutDimension { targetView.widthAnchor }
    var height: NSLayoutDimension { targetView.heightAnchor }
    
    var centerX: NSLayoutXAxisAnchor { targetView.centerXAnchor }
    var centerY: NSLayoutYAxisAnchor { targetView.centerYAnchor }
}

extension UIView {
    var lt: Layout {
        return Layout(view: self)
    }
}

struct LayoutSnapshot {
    var constraints: [NSLayoutConstraint]
    
    init(@AutoLayoutBuilder _ constraints: () -> [NSLayoutConstraint]) {
        self.constraints = constraints()
    }
    
    @discardableResult
    func activate() -> LayoutSnapshot {
        NSLayoutConstraint.activate(self.constraints)
        return self
    }
    
    @discardableResult
    func makeHierarchy(in view: UIView) -> LayoutSnapshot {
        for constraint in constraints {
            if let firstItem = (constraint.firstItem as? UIView) {
                // если вьюха еще не была добавлена в иерархию
                if firstItem.superview == nil {
                    // устанавливаем translatesAutoresizingMaskIntoConstraints
                    firstItem.translatesAutoresizingMaskIntoConstraints = false
                    // добавляем в иерархию
                    view.addSubview(firstItem)
                }
            }
        }
        return self
    }
}



class ViewController: UIViewController {
    
    lazy var blackView: UIView = {
        let view = UIView(label: "blackView")
        view.backgroundColor = .black
        return view
    }()
    
    lazy var greenView: UIView = {
        let view = UIView(label: "greenView")
        view.backgroundColor = .green
        return view
    }()
    
    lazy var redView: UIView = {
        let view = UIView(label: "redView")
        view.backgroundColor = .red
        return view
    }()
    
    lazy var yellowView: UIView = {
        let view = UIView(label: "yellowView")
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var greetingsLabel: UILabel = {
        let label = UILabel(label: "greetingsLabel")
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 24)
        label.text = "Hello, world!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.accessibilityLabel = "parentView"
        view.backgroundColor = .white
        
        let sizeConstant: CGFloat = 30
        
        let snap = LayoutSnapshot {
            greetingsLabel.center(of: view, offsetX: 0, offsetY: 140)
            
            blackView.center(of: view)
            blackView.square(sizeConstant)
            
            greenView.top(equalTo: blackView.lt.bottom, offset: 10)
            greenView.toCenterX(of: view)
            greenView.square(sizeConstant)
            
            redView.toCenterY(of: view)
            redView.left(equalTo: blackView.lt.right, offset: 10)
            redView.right(equalTo: view.lt.right, offset: 10)
            redView.square(sizeConstant)
            
            yellowView.pin(to: redView, margins: .all(10))
        }
        
        snap.makeHierarchy(in: view)
        snap.activate()
        
        snap.constraints.printConstraints()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

fileprivate func _preview() -> ViewController {
    ViewController()
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            _preview()
        }
    }
}
#endif
