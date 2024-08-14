//
//  ThirteenViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/14.
//

import Foundation
import UIKit

final class ThirteenViewController: UIViewController {
    @IBOutlet private weak var labelTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension ThirteenViewController {
    func setupConstraints() {
        // オブジェクトを取り除けない場合のトルツメ
        // 再利用を前提としていたり、状態変化によってオブジェクトの
        // 表示非表示が変わるような場合は、オブジェクトを取り除かずトルツメをする。
        
        // （例）UILabelのトルツメ
        // label.text = nilにするだけ
        label.text = nil
       
        // ラベルに関わる制約は残っているため、
        // マージンを調整する必要がある。
        // IBOutletとしてラベル上部の制約を持ち
        // そのプロパティのconstantプロパティを0にすると、
        // 不要な制約もなくなる。
        // labelTopConstraint.isActive = falseはレイアウトが崩れる。
        labelTopConstraint.constant = 0
    }
}
