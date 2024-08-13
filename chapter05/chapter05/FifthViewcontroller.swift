//
//  FifthViewcontroller.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

final class FifthViewcontroller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension FifthViewcontroller {
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        let label = UILabel()
        label.text = "Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        view.addSubview(label)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[label(100)]-8-[button]",
            options: .alignAllTop,
            metrics: nil,
            views: ["label": label, "button": button]
        )
        
        let verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[label]",
            options: .alignAllTop,
            metrics: nil,
            views: ["label": label]
        )
        // 一度に有効化する
        NSLayoutConstraint.activate(horizontalConstraints + verticalConstraints)
    }
}
