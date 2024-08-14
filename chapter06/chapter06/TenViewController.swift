//
//  TenViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class TenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension TenViewController {
    func setupConstraints() {
        // あるオブジェクト達を等幅間隔で並べる場合、
        // UIViewを用いることでレイアウトを実現できる。
        // このUIViewオブジェクトは空間として用いるので、
        // 背景の影響を除去するためにUIViewのbackgroundColorには、
        // .clearColorを設定する
        // ボタンとスペースには水平方向ひと繋がりになるような制約を与える。
        // ボタンの場合は、intrinsic content sizeで幅は決定される。
        // スペースには、等幅の制約を与える。
    }
}
