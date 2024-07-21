//
//  UIStackViewSample2ViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/21.
//

import Foundation
import UIKit

class UIStackViewSample2ViewController: UIViewController {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // .vertical or .horizontal
        stackView.axis = .vertical
        // .fill, .fillEqually, .filProportionally, .equalSpacing, .equalCentering
        // .fillは、intrinsic content sizeを満たしながら決定する。
        // .fillEquallyは、サブビューを均等な幅もしくは高さで並べる。
        // .fillProportionallyは、サブビューのintrinsic content sizeの比率に合わせた幅もしくは高さで並べる。
        // .equalSpacingは、サブビューのサイズを
        // intrinsic content sizeから変更せずに、スタックビューの軸方向における
        // サブビュー間のスペースを均一にして並べる。
        // SpacingプロパティとDistributionのEqual Spacingによる
        // スペースで大きい方の値がレイアウトに採用されるので注意が必要である。
        // サブビューはintrinsic content sizeに、余ったスペースは均等に分割される。
        stackView.distribution = .fill
        // .fill, .leading, .firstBaseLine, .center, .trailing, .lastBaseline
        // .fillは、高さが一番高いオブジェクトに他のオブジェクトの縦横比を変える
        stackView.alignment = .center
        stackView.spacing = 0
        return stackView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension UIStackViewSample2ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let additionalButton = UIButton()
        additionalButton.translatesAutoresizingMaskIntoConstraints = false
        additionalButton.addTarget(self, action: #selector(add), for: .primaryActionTriggered)
        additionalButton.setTitle("add", for: .normal)
        additionalButton.setTitleColor(.systemBlue, for: .normal)
        
        let removeButton = UIButton()
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.addTarget(self, action: #selector(remove), for: .primaryActionTriggered)
        removeButton.setTitle("remove", for: .normal)
        removeButton.setTitleColor(.systemBlue, for: .normal)
        
        let hiddenButton = UIButton()
        hiddenButton.translatesAutoresizingMaskIntoConstraints = false
        hiddenButton.addTarget(self, action: #selector(hidden), for: .primaryActionTriggered)
        hiddenButton.setTitle("Appear/Hidden", for: .normal)
        hiddenButton.setTitleColor(.systemBlue, for: .normal)
        
        stackView.addArrangedSubview(additionalButton)
        stackView.addArrangedSubview(removeButton)
        stackView.addArrangedSubview(hiddenButton)

        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

// MARK: Selector
private extension UIStackViewSample2ViewController {
    @objc func add() {
        let label: UILabel = {
            let label = UILabel()
            label.text = "Label"
            return label
        }()
        let lastIndex = stackView.arrangedSubviews.endIndex
        stackView.insertArrangedSubview(label, at: lastIndex)
    }
    
    @objc func remove() {
        if let lastArrangedSubView = stackView.arrangedSubviews.last,
           3 < stackView.arrangedSubviews.count {
            stackView.removeArrangedSubview(lastArrangedSubView)
            lastArrangedSubView.removeFromSuperview()
        }
    }
    
    @objc func hidden() {
        if let lastArrangedSubView = stackView.arrangedSubviews.last,
           3 < stackView.arrangedSubviews.count {
            lastArrangedSubView.isHidden.toggle()
        }
    }
}
