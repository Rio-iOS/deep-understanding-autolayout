//
//  TwelveViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/14.
//

import Foundation
import UIKit

final class TwelveViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension TwelveViewController {
    func setupConstraints() {
        // オブジェクトを取り除ける場合のトルツメ
        // トルツメをする場合、オブジェクトを　取り除ける場合と、
        // そうでない場合で方法が異なる。
        // 取り除いたオブジェクトを再度利用する可能性がない場合は、
        // 以下の方法でトルツメすると、よりシンプルに実装可能である。
        // imageViewとlikeButtonの間に優先度の低い制約を定義する。
        // ラベルの高さはintrinsic content size より与えられているため、
        // 設定した制約の優先度は、ラベルのContent Compression Resistanceよりも低い必要がある。
        // 上記の状態のまま、label.removeFromSuperview()を実行する。
        label.removeFromSuperview()
    }
}
