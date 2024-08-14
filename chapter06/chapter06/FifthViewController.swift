//
//  FifthViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class FifthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension FifthViewController {
    func setupConstraints() {
        // コンテンツのサイズに合わせてレイアウトするパターン
        // コンテンツサイズに合わせて柔軟にレイアウトを変更したい場合は、
        // Intrinsic Content Sizeを用いてオブジェクトのサイズを決定できるようにする。
        // UILabelオブジェクト等は、Intrinsic Content Sizeに基づいた制約が
        // NSContentSizeLayoutConstraintとして与えられる。
        // この制約はContent Hugging Priorityと
        // Content Compression Resistance Priorityによって
        // 与えられた優先度を持ち、デフォルトの値はRequiredではない。
        // コンテンツの内容に合わせてレイアウトしたい場合は、
        // 明示的に優先度を高くするか、オブジェクトのサイズが柔軟に変化できるように制約を与える。
        // （例）
        // labelのintrinsic content sizeは以下から決定される。
        // - textプロパティに与えられる文章
        // -  fontプロパティのフォント情報
        // - numberOfLinesプロパティによって決定される行数
        // numberOfLinesを0に設定すると、改行して全文章が表示される
    }
}
