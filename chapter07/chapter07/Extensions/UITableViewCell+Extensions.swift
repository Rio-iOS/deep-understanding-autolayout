//
//  UITableViewCell+Extensions.swift
//  chapter07
//
//  Created by 藤門莉生 on 2024/08/16.
//

import Foundation
import UIKit

// AytoLayoutが提供される以前は、
// ビューオブジェクトそれぞれの高さを計算し、スペースと足し合わせて
// セルの高さを計算する必要があった。
// しかし、AutoLayoutを利用すると、カスタムセルを生成してレイアウトを実行するのみなので、
// コードもシンプルになる。
extension UITableViewCell {
    // オフスクリーンセルであるため、
    // 画面上でレイアウトが実施されるわけではなく、
    // 制約を満たすレイアウトをメモリ上で実現する。
    func calculateHeight() -> CGFloat {
        // 既にセルはレイアウトに必要なインプットである
        // テーブルビューの幅とレイアウト用データを持っているので、
        // layoutIfNeeded()を読んでレイアウトを実施する。
        // この時、FristViewLabelオブジェクトのdetailLabelのlayoutSubviews()も呼ばれて、
        // preferredMaxLayoutWidthが設定されるため、
        // 既に渡した画面の幅に合わせて適切にレイアウトされる。
        layoutIfNeeded()
        
        // 次に、制約を満たした時のサイズを返すsystemLayoutSizeFittingSize(_:)を呼ぶことで、
        // 高さを取得している。
        // このメソッドの引数に、以下を指定する。
        // - UIView.layoutFittingCompressedSize：レイアウトを満たす最小サイズを返す
        // - UIView.layoutFittingExpandedSize：レイアウトを満たす最大サイズを返す
        // 制約を満たす高さの取得
        let cellHeight = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
      
        // 最後にセパレータの高さが足され、カスタムセルの高さが計算される。
        // セパレータの高さ1.0を足す
        return cellHeight + 1.0
    }
}
