//
//  NSConstraintInterfaceBuilderSampleViewController.swift
//  chapter02
//
//  Created by 藤門莉生 on 2024/07/18.
//

import Foundation
import UIKit

final class NSConstraintInterfaceBuilderSampleViewController: UIViewController {
    private let purpuleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button3", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        showIntrinsicContentSize()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

private extension NSConstraintInterfaceBuilderSampleViewController {
    func setupViews() {
        view.addSubview(purpuleButton)
        NSLayoutConstraint.activate([
            purpuleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            purpuleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
        ])
        
        setupConstraints()
    }
    func setupConstraints() {
        let hightPriorityConstraint = NSLayoutConstraint(
            item: purpuleButton as Any,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 50
        )
        
        let lowPriorityConstraint = purpuleButton.heightAnchor.constraint(equalToConstant: 40)
        lowPriorityConstraint.priority = .init(500)
        lowPriorityConstraint.isActive = true
        purpuleButton.addConstraint(lowPriorityConstraint)
       
        // こちらの制約が優先
        let highPriorityConstraint = purpuleButton.heightAnchor.constraint(equalToConstant: 50)
        highPriorityConstraint.priority = .init(501)
        highPriorityConstraint.isActive = true
        purpuleButton.addConstraint(highPriorityConstraint)
    }
    
    func showIntrinsicContentSize() {
        print("✅intrinsicContentSize: \(purpuleButton.intrinsicContentSize)")
    }
}
