//
//  SeventhViewController.swift
//  chapter04
//
//  Created by 藤門莉生 on 2024/08/11.
//

import Foundation
import UIKit

final class SeventhViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemBackground
        // Xibファイルの読み込み
        // Xibファイルは、Storyboardと違って、
        // 生成しただけではInitialViewControllerとして表示することはできない。
        // .loadNibNamed(_:, owner:, options:)でXibファイル名を指定し、
        // Xibファイル上のオブジェクトを読み込む。
        // xibファイルはオブジェクトの配列として渡される。
        // xibファイルには複数のViewを定義できるが、
        // トップレベルのViewが1つの場合は、
        // xibファイルで作成したViewは配列の一番最初に格納される。
        guard let customView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customView)
        
        
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
