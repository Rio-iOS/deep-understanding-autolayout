//
//  NineViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class NineViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension NineViewController {
    func setupConstraints() {
        // 同一幅のオブジェクトパターン
        // （例）画面幅に合わせて複数のボタンの幅を変化させる場合
        // 画面サイズに合わせて変化するパターンと同様の考え方で実現することができる。
        // 基本的な考え方は、ボタン達の幅に自由度を与えると同時に、
        // ボタン達の幅が均等になるような制約を与える
        // - 水平方向
        //   - button1.leading = leading
        //   - button2.leading = button1.trailing + 8
        //   - button3.leading = button2.trailing + 8
        //   - button1.width = button3.width
        //   - button2.width = button1.width
    }
}
