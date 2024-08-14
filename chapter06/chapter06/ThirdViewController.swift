//
//  ThirdViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension ThirdViewController {
    func setupConstraints() {
        // 画面サイズに合わせて変化するパターン
        // 幅の制約で固定する
        // 画面幅にボタンサイズを揃える方法として以下がある。
        // - 水平方向
        //   - searchButton.width = width
        //   - searchButton.centerX = centerX
        // - 垂直方向
        //   - saerchButton.height = 40
        //   - Button Layout Guide.top = searchButton.bottom
        // 水平方向に、親ビューとボタンの幅を一致させる制約と、中央揃えの制約を与えている。
    }
}
