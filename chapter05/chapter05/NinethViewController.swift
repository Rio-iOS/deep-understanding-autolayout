//
//  NinethViewController.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class NinethViewController: UIViewController {
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension NinethViewController {
    func setupConstraints() {
        // レイアウトガイドを生成
        let space = UILayoutGuide()
      
        // レイアウトガイドに追加
        view.addLayoutGuide(space)
       
        // レイアウトガイドラインの幅をSaveButtonと揃える
        space.widthAnchor.constraint(equalTo: saveButton.widthAnchor).isActive = true
        // レイアウトガイドの水平方向中央揃え
        space.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // 各ボタンとレイアウトガイドの水平方向の制約
        saveButton.trailingAnchor.constraint(equalTo: space.leadingAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: space.trailingAnchor).isActive = true
        
        view.layoutIfNeeded()
    }
}
