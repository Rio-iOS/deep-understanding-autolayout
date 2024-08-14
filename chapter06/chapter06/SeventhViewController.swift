//
//  SeventhViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
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
        // 2つのオブジェクトのサイズ比率を用いる方法
        // あるオブジェクトのサイズに対して、任意の比率でレイアウトを設定することも可能
        // （例）
        // - 親ビューの幅に対して90%の幅を持つボタンを作成
        // - button.width = 0.9 * superView.width
        // 距離の比率を用いる方法
        // （例）
        // ナビゲーションバーの高さを親ビューの高さの20%にしたい
        // navigationBar.bottom = 5 * superView.bottom
    }
}
