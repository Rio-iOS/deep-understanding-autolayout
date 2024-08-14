//
//  SeventeenViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/14.
//

import Foundation
import UIKit

final class SeventeenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension SeventhViewController {
    func setupConstraints() {
        // UIStackViewを使う
        // UIStackViewはiOS9.0以降で使うことができる
        // iOSアプリの基本的なレイアウト実現するためには最適なクラスである。
        // UIStackViewを用いてレイアウトするには、
        // 小さい単位から始める。
        // 1. 同じ階層に配置したいビューからスタックビューに追加する。
        // 2. これを繰り返し、必要なビューをスタックビューに配置したら、制約を与え、並び方やスペースの調整
        // スタックビューを用いることで、ほぼ制約を扱うことなく希望するレイアウトを実現できる。
        // UIStackViewは制約を自動的に付与するため、端末の回転や複数画面サイズにも対応しており、
        // 柔軟性も高く、強力なツールとなる。
    }
}
