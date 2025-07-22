//
//  ViewController.swift
//  Anomer
//
//  Created by Рафаэль Голубев on 22.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var greetingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 24)
        label.text = "Hello, world!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(greetingsLabel)
        NSLayoutConstraint.activate([
            greetingsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            greetingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

