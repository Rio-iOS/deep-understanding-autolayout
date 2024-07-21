//
//  RenderingSumpleViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/21.
//

import Foundation
import UIKit

class RenderingSumpleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension RenderingSumpleViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
       
        let customView1 = CustomView()
        customView1.backgroundColor = .systemBlue
        let customView2 = CustomView()
        customView2.backgroundColor = .systemGreen
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
       
        stackView.addArrangedSubview(customView1)
        stackView.addArrangedSubview(customView2)
        
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

fileprivate class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: 200, height: 100)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        print("✅ do - updateConstraints()")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("✅ do - layoutSubviews()")
    }
   
    // フレーム情報が更新された後に、ディスプレイに変更を表示するために
    // draw(_: CGRect)が呼ばれる
    // iOSでは、draw(_: CGRect)が、それぞれのビューを一度だけ
    // オフスクリーンバッファに描画する。
    // 描画されたレイヤーはそれぞれ独立した矩形となっており、
    // 明示的にフラグを立てない限り、単純なオブジェクトの移動や
    // 拡大縮小では描画されない。
    // 再描画処理が必要な矩形は、draw(_: CGRect)が
    // グラフィックコンテキストを引数として受け取り、描画処理を実行
    // タイミングは以下である。
    // - ビューの一部を隠している別のビューの移動または除去
    // - hidden（非表示）になっていたビューの再表示（プロパティをNOに設定）
    // ビューを画面外にまでスクロールし、再び画面内に戻す
    // ビューのsetNeedsDisplayメソッドまたは、setNeedsDisplayInRect(_:)メソッドの明示的な呼び出し
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("✅ do - draw(_: CGRect)")
        print("✅ rect: \(rect)")
    }
   
    // setNeesDisplay() または seNeedsDisplay(_: CGRect)を
    // 呼ぶことで、再描画のトリガを与えて実行
    // タイマーを用いて1秒間に複数回レンダリングすることも可能
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print("✅ do - setNeedsDisplay()")
    }
}
