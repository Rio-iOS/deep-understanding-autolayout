//
//  TopViewController.swift
//  chapter04
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

final class TopViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension TopViewController {
    func setupConstraints() {
        let button1 = makeButton(title: "button1")
        button1.addTarget(self, action: #selector(showFirstViewController), for: .primaryActionTriggered)
        
        let button2 = makeButton(title: "button2")
        button2.addTarget(self, action: #selector(showSecondViewController), for: .primaryActionTriggered)
        
        let button3 = makeButton(title: "button3")
        button3.addTarget(self, action: #selector(showThirdViewController), for: .primaryActionTriggered)
        
        let button4 = makeButton(title: "button4")
        button4.addTarget(self, action: #selector(showForthViewController), for: .primaryActionTriggered)
        
        let button5 = makeButton(title: "button5")
        button5.addTarget(self, action: #selector(showFifthViewController), for: .primaryActionTriggered)
        
        let button6 = makeButton(title: "button6")
        button6.addTarget(self, action: #selector(showSixthViewController), for: .primaryActionTriggered)
        
        let button7 = makeButton(title: "button7")
        button7.addTarget(self, action: #selector(showSeventhViewController), for: .primaryActionTriggered)
        
        let button8 = makeButton(title: "button8")
        button8.addTarget(self, action: #selector(showEighthViewController), for: .primaryActionTriggered)
        
        let button9 = makeButton(title: "button9")
        button9.addTarget(self, action: #selector(showMultipleMainViewController), for: .primaryActionTriggered)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
                
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        stackView.addArrangedSubview(button5)
        stackView.addArrangedSubview(button6)
        stackView.addArrangedSubview(button7)
        stackView.addArrangedSubview(button8)
        stackView.addArrangedSubview(button9)

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            // scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // stackView
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}

private extension TopViewController {
    @objc func showFirstViewController(sender: UIButton) {
        let vc = FirstViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showSecondViewController(sender: UIButton) {
        // UIStoryboardのクラスメソッドinit(name:,bundle:)
        // nameパラメータによって指定されたファイル名（拡張子は除く）の初期化
        // bundleパラメータは、Storyboardが存在するディレクトリのパスを受け取り、
        // そのパスで name で指定したStoryboardを探す。
        // nilを指定すると、メインバンドルが指定される。
        print("✅ Bundle.main.bundleURL: \(Bundle.main.bundleURL)")
        // file:///Users/riofujimon/Library/Developer/CoreSimulator/Devices/1B00C888-AB67-4969-8972-CF5B26C5C1A8/data/Containers/Bundle/Application/B4B2B398-8AA8-4A51-B18E-4AED381A36A1/chapter04.app/
        print("✅ Bundle.main.bundlePath: \(Bundle.main.bundlePath)")
        // /Users/riofujimon/Library/Developer/CoreSimulator/Devices/1B00C888-AB67-4969-8972-CF5B26C5C1A8/data/Containers/Bundle/Application/B4B2B398-8AA8-4A51-B18E-4AED381A36A1/chapter04.app
        let vc = UIStoryboard(name: "SecondView", bundle: Bundle.main).instantiateViewController(identifier: "SecondView")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showThirdViewController() {
        let vc = UIStoryboard(name: "ThirdView", bundle: Bundle.main).instantiateViewController(identifier: "ThirdView")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showForthViewController() {
        let vc = UIStoryboard(name: "ForthView", bundle: Bundle.main).instantiateViewController(identifier: "ForthView")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showFifthViewController() {
        let vc = UIStoryboard(name: "FifthView", bundle: Bundle.main).instantiateViewController(identifier: "FifthView")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showSixthViewController() {
        let vc = UIStoryboard(name: "SixthView", bundle: Bundle.main).instantiateViewController(identifier: "SixthView")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showSeventhViewController() {
        let vc = SeventhViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showEighthViewController() {
        let vc = MSTabViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showMultipleMainViewController() {
        guard let vc = UIStoryboard(name: "MultipleMainStoryboard", bundle: Bundle.main).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
