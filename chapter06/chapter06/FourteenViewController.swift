//
//  FourteenViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/14.
//

import Foundation
import UIKit

final class FourteenViewController: UIViewController {
    @IBOutlet private weak var imageViewTopConstarint: NSLayoutConstraint!
    @IBOutlet private weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension FourteenViewController {
    func setupConstraints() {
        // UIImageViewのトルツメ
        // UIImageViewのintrinsic content sizeを決めるのは、imageプロパティ
        // つまり、imageプロパティを空にする。
        imageView.image = nil
       
        // その後、マージンを調整する。
        imageViewTopConstarint.constant = 0
    }
}
