//
//  ThirdViewCell.swift
//  chapter07
//
//  Created by 藤門莉生 on 2024/08/16.
//

import Foundation
import UIKit

final class ThirdViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
   
    static let nibName = "ThirdViewCell"
    static let reuseIdentifier = "ThirdViewCell"

    override class func awakeFromNib() {
        super.awakeFromNib()
        
        // UITableViewCellのcontentViewに対して
        // 「オブジェクトのグループ化パターン」を適用することで
        // 内部からセルの高さを計算している。
        // detailLabelは、長いテキストを持つので、
        // numberOfLinesを0としている。
        // - 水平方向の制約
        //   - leadingMargin = titleLabel.leading
        //   - trailingMargin = titleLabel.trailing
        //   - leadingMargin = detailLabel.leading
        //   - trailingMargin = detaiilLabel.trailing
        // - 垂直方向の制約
        //   - titleLabel.top = topMargin
        //   - detailLabel.top = titleLabel.bottom + 8
        //   - detailLabel.bottom = bottomMargin
        // 水平方向については、画面幅が決定しており、
        // どちらのラベルもleadingとtrailingに制約を持っていることから、
        // 「画面サイズに合わせて変化するパターン」である。
        // 垂直方向は、ラベルに与えられるNSContentSizeLayoutConstraintにより、
        // セルのコンテントビュー内の制約が上から下にひと繋がりに定義されるため、
        // 「オブジェクトのグループ化パターン」となっている。
        // コンテントビューの高さは、セルの幅に依存して決定されるtitleLabelと
        // detailLabelの高さによって決定されるため、コンテンツに依存したレイアウトになる。
        // しかし、制約はAuto Layoutエンジンによってボトムアップ（子ビューから親ビュー）に
        // 計算されるため、子ビューであるラベルの制約を決定する時に
        // 親ビューであるセルの制約は決定しておらず、現状の設定だと画面幅に合わせたラベルにおける
        // intrinsic content sizeの高さを取得することはできない。
        // この問題は、UILabelの幅の基準となるpreferredMaxLayoutWidthプロパティを用いることで
        // 解決することができる。
    }
    
    func layoutWithData(data: Person) {
        titleLabel.text = data.name
        detailLabel.text = data.detail
        // DynamicTypeに対応
        // UIFont.preferredFont(forTextStyle:)を指定する
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        detailLabel.font = .preferredFont(forTextStyle: .body)
    }
}

