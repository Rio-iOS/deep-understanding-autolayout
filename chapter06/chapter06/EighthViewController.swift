//
//  EighthViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class EighthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension EighthViewController {
    func setupConstraints() {
        // 複数のオブジェクトへのレイアウト定義とは、
        // オブジェクト間の距離の定義であったり、
        // オブジェクト達をひとまとまりのグループとした時のレイアウト定義を指している。
        // これらのレイアウトパターンによって、制約によるレイアウト定義のみでは
        // 実現できないレイアウトを実現することができる。
        // コードでレイアウトを指定している且つiOS9.0以上のみをサポートする場合であれば、
        // UILayoutGuideを用いてレイアウト空間を定義することができるが、
        // IB上ではUILayoutGuideが使えない。
        // IB内で同様のことを実現するためには、UILayoutGuideの代わりとして、
        // 空間定義にUIViewを使うことが必要となる。
        
        // オブジェクトグループパターン
        // 複数のビューをUIViewの子ビューとして追加し、
        // ひとまとまりのグループにすることはよくある。
        // グループ化することで、レイアウトをカプセル化できるため
        // 他のオブジェクトへの影響を最小限に止めることができたり、
        // グループとして中央揃えを実行できたりと、
        // メリットは多くある。
        // コンテンツのサイズによって親ビューの幅が決定される。
        // 親ビューのサイズは、内部のオブジェクト達の制約によって決定する。
        // 内部のオブジェクトのサイズが一意に決まるため、親ビューのサイズも決定できる。
        // 制約のポイントは、垂直方向であれば、上から下まで、
        // 水平方向であれば右から左まで制約を繋げることである。
        
        // (例)
        // - 垂直方向
        //   - locationLabel.top = top
        //   - weatherIcon.top = locationLabel.bottom + 30
        //   - weatherIcon.height = 70
        //   - bottom = weatherIcon.bottom
        //   - UILabelはintrinsic content sizeによって高さが決まっている
        // - 親ビューの高さが一意に決まる
        // - 水平方向
        //   - locationLabel.leading = leading
        //   - trailing = locationLabel.trailing
        //   - weatherIcon.leading = leading
        //   - weatherIcon.width = 70
        //   - weatherLabel.leading = weatherIcon.trailing + 8
        //   - trailing = weatherLabel.trailing
    }
}
