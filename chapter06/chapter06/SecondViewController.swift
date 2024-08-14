//
//  SecondViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension SecondViewController {
    func setupConstraints() {
        // ビューオブジェクトを配置するときに最も簡単なパターンは、オブジェクトのサイズを固定する場合である。
        // あるオブジェクトの高さと幅の制約を与えるため、
        // 水平方向、垂直方向それぞれに1つずつ位置を決定する制約を与えればレイアウトは確定する。
        // （例）
        // - 水平方向
        //   - icon.width = 30.0
        //   - leadingMargin = icon.leading
        // - 垂直方向
        //   - icon.height = 30.0
        //   - icon.top = Top Layout Guide.botom + 30.0
        
        // 画面サイズに合わせて変化するパターン
        // - 水平方向
        //   - searchButton.leading =  leading
        //   - trailing = searchButton.trailing
        // - 垂直方向
        //   - searchButton.height = 40.0
        //   - Bottom Layout Guide.top = searchButton.bottom
    }
}
