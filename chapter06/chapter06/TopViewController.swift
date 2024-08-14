//
//  TopViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension TopViewController {
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
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
        button9.addTarget(self, action: #selector(showNineViewController), for: .primaryActionTriggered)
        
        let button10 = makeButton(title: "button10")
        button10.addTarget(self, action: #selector(showTenViewController), for: .primaryActionTriggered)
        
        let button11 = makeButton(title: "button11")
        button11.addTarget(self, action: #selector(showElevenViewController), for: .primaryActionTriggered)
        
        let button12 = makeButton(title: "button12")
        button12.addTarget(self, action: #selector(showTwelveViewController), for: .primaryActionTriggered)
        
        let button13 = makeButton(title: "button13")
        button13.addTarget(self, action: #selector(showThirteenViewController), for: .primaryActionTriggered)
        
        let button14 = makeButton(title: "button14")
        button14.addTarget(self, action: #selector(showForteenViewController), for: .primaryActionTriggered)
        
        let button15 = makeButton(title: "button15")
        button15.addTarget(self, action: #selector(showFifteenViewController), for: .primaryActionTriggered)
        
        let button16 = makeButton(title: "button16")
        button16.addTarget(self, action: #selector(showSixteenViewController), for: .primaryActionTriggered)
        
        let button17 = makeButton(title: "button17")
        button17.addTarget(self, action: #selector(showSeventeenViewController), for: .primaryActionTriggered)
       
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        stackView.addArrangedSubview(button5)
        stackView.addArrangedSubview(button6)
        stackView.addArrangedSubview(button7)
        stackView.addArrangedSubview(button8)
        stackView.addArrangedSubview(button9)
        stackView.addArrangedSubview(button10)
        stackView.addArrangedSubview(button11)
        stackView.addArrangedSubview(button12)
        stackView.addArrangedSubview(button13)
        stackView.addArrangedSubview(button14)
        stackView.addArrangedSubview(button15)
        stackView.addArrangedSubview(button16)
        stackView.addArrangedSubview(button17)

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
        guard let viewController = UIStoryboard(name: "FirstView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showSecondViewController() {
        guard let viewController = UIStoryboard(name: "SecondView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showThirdViewController() {
        guard let viewController = UIStoryboard(name: "ThirdView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showForthViewController() {
        guard let viewController = UIStoryboard(name: "ForthView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showFifthViewController() {
        guard let viewController = UIStoryboard(name: "FifthView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showSixthViewController() {
        guard let viewController = UIStoryboard(name: "SixthView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showSeventhViewController() {
        guard let viewController = UIStoryboard(name: "SeventhView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showEighthViewController() {
        guard let viewController = UIStoryboard(name: "EighthView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showNineViewController() {
        guard let viewController = UIStoryboard(name: "NineView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showTenViewController() {
        guard let viewController = UIStoryboard(name: "TenView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showElevenViewController() {
        guard let viewController = UIStoryboard(name: "ElevenView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showTwelveViewController() {
        guard let viewController = UIStoryboard(name: "TwelveView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showThirteenViewController() {
        guard let viewController = UIStoryboard(name: "ThirteenView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showForteenViewController() {
        guard let viewController = UIStoryboard(name: "FourteenView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showFifteenViewController() {
        guard let viewController = UIStoryboard(name: "FifteenView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showSixteenViewController() {
        guard let viewController = UIStoryboard(name: "SixteenView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showSeventeenViewController() {
        guard let viewController = UIStoryboard(name: "SeventeenView", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
