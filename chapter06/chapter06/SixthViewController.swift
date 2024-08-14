//
//  SixthViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
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
        // 比率で配置するパターン
        // サイズや距離の比率で指定するパターンもある
        // 縦横比を保ったまま画像を表示するにはAspect Ratioを利用する。
        // （例）
        // - 画像サイズの比率
        //   - aspect = 300 : 225
        // - 水平方向
        //   - trailingMargin = image.trailing
        //   - image.leading = leadingMargin
        // - 垂直方向
        //   - image.top = Top Layout Guide.bottom + 20
        //   - label.top = image.bottom + 30

    }
}
