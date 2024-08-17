//
//  FirstViewLabel.swift
//  chapter07
//
//  Created by 藤門莉生 on 2024/08/15.
//

import Foundation
import UIKit

class FirstViewLabel: UILabel {
    override func layoutSubviews() {
        // preferredMaxLayoutWidth - 複数行のラベル幅
        // preferredMaxLayoutWidthは、UILabelオブジェクトの最大幅を定義する。
        // オフスクリーンでセルをレンダリングする際に
        // UILabelに対して正確なintrinsic content sizeが与えられていない問題を解決するのが、
        // このpreferredMaxLayoutWidthである。
        // UILabelのintrinsic content size を決定するには、
        // 高さか幅のどちらかが決まっている必要がある。
        // そこで、最大幅であるpreferredMaxLayoutWidthを決定させる。
        // 通常親ビューの幅に依存してprefferedMaxLayoutWidthが決定されるため、
        // 親ビューのレイアウトが決定した後に値をセットする必要がある。
        // セットされたpreferredMaxLayoutWidthの値を元に再レイアウトすることで、
        // コンテンツの内容に合わせたフレームを取得することができる。
        // layoutSubviews()で設定する。
        // layoutSubviews()が呼ばれる時には、既に制約の計算は終わっており、
        // 与えられた制約に基づいたラベルのフレームがトップダウン（親ビューから子ビュー）に
        // 順番に与えられている。
        // 制約によってラベルの幅と高さは決定されているが、
        // この段階では文字列の長さによらず、1行で表示した場合のサイズになっている。
        // ラベルの幅は、画面幅から既に一意に決定しているため、
        // この幅をpreferredMaxLayoutWidthに設定する。
        // すると、ラベルのintrinsic content sizeは、コンテンツに合わせて設定した
        // 幅と高さを持つようになる。
        // 最後にsuper.layoutSubviews()を呼ぶことで再度レイアウトが実施され、
        // 再計算されたサイズが適用される。
        preferredMaxLayoutWidth = bounds.width
        super.layoutSubviews()
    }
}
