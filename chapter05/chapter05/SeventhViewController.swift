//
//  SeventhViewController.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

final class SeventhViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension SeventhViewController {
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
       
        // 制約を追加するビューが制約のすべての要素をサブビューとして持っている必要がある。
        // つまり、labelやbuttonの制約を追加するには、これらのビューが同じ親ビューに属していることが前提である。
        view.addConstraint(
            .init(
                item: label,
                attribute: .top,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .top,
                multiplier: 1.0,
                constant: 0
            )
        )
        
        view.addConstraint(
            .init(
                item: label,
                attribute: .leading,
                relatedBy: .equal,
                toItem: view,
                attribute: .leading,
                multiplier: 1.0,
                constant: 8.0
            )
        )
        
        view.addConstraint(
            .init(
                item: button,
                attribute: .top,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .top,
                multiplier: 1.0,
                constant: 0
            )
        )
        
        view.addConstraint(
            .init(
                item: button,
                attribute: .leading,
                relatedBy: .equal,
                toItem: label,
                attribute: .trailing,
                multiplier: 1.0,
                constant: 8.0
            )
        )
       
        let buttonTrailingConstraint = NSLayoutConstraint(
            item: button,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1.0,
            constant: -8.0
        )
        view.addConstraint(buttonTrailingConstraint)
       
        // UIView の　removeConstraint()を利用することで制約を削除できる
        // 複数の制約を削除する場合は、removeConstraints()を利用する
        view.removeConstraint(buttonTrailingConstraint)
        
        // 制約の削除は、制約に関わるViewがレイアウト上から消えたときにも発生する。
        // （例）
        // - label.removeFromSuperview()が呼ばれた時
        // - labelに関する制約が全て削除される
        // - labelとbuttonに関連する制約も削除されるため注意が必要である。
    }
}
