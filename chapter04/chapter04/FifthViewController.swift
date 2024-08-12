//
//  FifthViewController.swift
//  chapter04
//
//  Created by 藤門莉生 on 2024/08/11.
//

import Foundation
import UIKit

final class FifthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

final class IntrinsicCntentSizeLowLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        .init(width: 150, height: 40)
    }
}

// Equal Width や Equal Heightを選択した時は、
// 別途大きさの制約を与えていない時は、
// intrinsicContentSize が大きい方が優先される
// 通常は、Content Hugging Priority（大きくなりにくさ）よりも
// Compression Resistance Priority（小さくなりにくさ）が優先されるため。
final class IntrinsicCntentSizeHighLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        .init(width: 250, height: 40)
    }
}
