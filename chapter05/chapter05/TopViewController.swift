//
//  TopViewController.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import UIKit

final class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
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
        button8.addTarget(self, action: #selector(showEigthViewController), for: .primaryActionTriggered)
        
        let button9 = makeButton(title: "button9")
        button9.addTarget(self, action: #selector(showNinethViewController), for: .primaryActionTriggered)

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
    @objc func showFirstViewController() {
        let vc = FirstViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showSecondViewController() {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showThirdViewController() {
        let vc = ThirdViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showForthViewController() {
        guard let vc = UIStoryboard(name: "ForthView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showFifthViewController() {
        let vc = FifthViewcontroller()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showSixthViewController() {
        let vc = SixthViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showSeventhViewController() {
        let vc = SeventhViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showEigthViewController() {
        guard let vc = UIStoryboard(name: "EighthView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showNinethViewController() {
        guard let vc = UIStoryboard(name: "NinethView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
