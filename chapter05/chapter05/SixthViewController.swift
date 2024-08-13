//
//  SixthViewController.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

final class SixthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension SixthViewController {
    func setupConstraints() {
        view.backgroundColor = .systemBackground
      
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(button)
       
        let constraints = [
            // label
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0),
            // button
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8.0),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0),
        ]
        
        NSLayoutConstraint.activate(constraints)
        // 制約を削除する時もiOS8.0以降とiOS7系以前では方法が異なる。
        // iOS8.0以降であれば、NSLayoutConstraintのactiveプロパティをfalseにすることで制約は無効化される。
        // 配列で一度に無効化する場合は、NSLayoutConstraint.deactivate()を利用する。
        NSLayoutConstraint.deactivate(constraints)
    }
}
