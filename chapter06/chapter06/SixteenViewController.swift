//
//  SixteenViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/14.
//

import Foundation
import UIKit

final class SixteenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension SixteenViewController {
    func setupConstraints() {
        // 動的なスクロール領域を持つUIScrollViewパターン
        // AutoLayoutを用いることでUIScrollViewのスクロール領域を、
        // 計算することなく、コンテンツのサイズに合わせることができる。
        
        // AutoLayoutにおけるスクロール領域指定
        // AutoLayoutを用いると、UIScrollViewのスクロール可能領域と
        // コンテンツの大きさを揃えることができる。
        // 方法は非常に簡単で、UIScrollViewオブジェクトのビューの内部から制約を与え、
        // 適切なcontentSizeを与えるというものである。
        // 1. UIScrollViewオブジェクトに対してUIViewオブジェクト（コンテナビュー）をスクロール可能領域といして貼り付ける。
        // 2. コンテナビューはスクロール可能領域に配置されているので、親ビューのLeading、Trailing、Top、Bottomに対してconstant = 0の制約を与えれば、UIScrollView.contentSizeとコンテナービューの大きさが一緒になる。
        // 3. この状態では、コンテナビューの水平方向と垂直方向それぞれに対する制約が不十分なため、エラーが表示される。
        // 4. この状態でコンテナビューに幅と高さが一意に決まる制約を与えると、その値がスクロールビューのcontentSizeとなる。実際には、「オブジェクトのグループ化パターン」のように、内部からコンテントビューのサイズを決めることになる。
        
        // AutoresizingMaskと混ぜて使う
        // AutoLayoutを利用している場合は、
        // 基本的にビューのtranslateAutoresizingMaskIntoConstraintsプロパティを
        // falseにすることで、Autoresizingから制約への変換を防ぎ、
        // 余計な制約が追加されないようにする。
        // 自動的生成された制約と開発者が追加した制約がコンフリクトすることが多いからである。
        // しかし、この自動的な変換を有効活用できる場合もある。
        // レイアウトがカプセル化されたxibファイルをあるビューの中で単体で使う時などである。
        // （例）UITableViewとUICollectionViewとで共通のビューを持ちたい場合に、
        //      UIViewのカスタムクラスにどちらにも使える一般化したレイアウトを定義する場合
        // UITableViewCellとUICollectionViewCellのサブクラスのインスタンスに
        // それぞれaddSubView()によって追加する。
        // （例）
        // var contentView = ContentView(frame: cell.bounds)
        // contentView.layoutWithDta(data) // 任意のレイアウトメソッドを呼ぶ
        // cell.addSubView(contentView)
        // 1行目で初期化する際に、セルの大きさと位置を渡しているため、
        // コンテナビューはセルと同じサイズ、位置になる。
        // translatesAutoresizingMaskIntoConstraintsプロパティをfalseにしていないため、
        // このフレームを元に自動的に制約が生成され、レイアウトが保たれる。
    }
}
