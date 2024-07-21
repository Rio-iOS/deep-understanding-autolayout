//
//  LayoutSubViewSampleViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/19.
//

import Foundation
import UIKit

class LayoutSubViewSampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension LayoutSubViewSampleViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let customView = CustomView()
        
        view.addSubview(customView)
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

fileprivate class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    // レイアウトの変更は、layoutSubviews()で実施
    // オーバーライドすることで、制約付与によるレイアウトでは難しい場合も実現可能
    // super.layoutSubviews()が呼び出された時点ですでに更新されているので、
    // そのレイアウト情報を用いて処理を実行したい場合に有効
    // layoutSubviews()は、通常のレイアウトパスでupdateConstraints()と
    // 共にバッチ処理的にレイアウトの更新を行うので、
    // メインスレッドをブロックせずにレイアウトの変更が可能
    override func layoutSubviews() {
        super.layoutSubviews()
        print("✅ do - layoutSubviews()")
    }
}
