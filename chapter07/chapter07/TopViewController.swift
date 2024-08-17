//
//  TopViewController.swift
//  chapter07
//
//  Created by 藤門莉生 on 2024/08/15.
//

import UIKit

final class TopViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension TopViewController {
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let button1 = makeButton(title: "button1")
        button1.addTarget(self, action: #selector(showFirstViewController), for: .primaryActionTriggered)
        
        let button2 = makeButton(title: "button2")
        button2.addTarget(self, action: #selector(showSecondViewController), for: .primaryActionTriggered)
        
        let button3 = makeButton(title: "button3")
        button3.addTarget(self, action: #selector(showThirdViewController), for: .primaryActionTriggered)
        
        let button4 = makeButton(title: "button4")
        button4.addTarget(self, action: #selector(showFourthViewController), for: .primaryActionTriggered)
        
        let button5 = makeButton(title: "button5")
        button5.addTarget(self, action: #selector(showFifthViewController), for: .primaryActionTriggered)
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        stackView.addArrangedSubview(button5)

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
        guard let vc = UIStoryboard(name: "FirstView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showSecondViewController() {
        guard let vc = UIStoryboard(name: "SecondView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showThirdViewController() {
        guard let vc = UIStoryboard(name: "ThirdView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showFourthViewController() {
        guard let vc = UIStoryboard(name: "FourthView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showFifthViewController() {
        guard let vc = UIStoryboard(name: "FifthView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
