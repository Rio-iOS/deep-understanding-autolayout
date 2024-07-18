//
//  TopViewController.swift
//  chapter02
//
//  Created by 藤門莉生 on 2024/07/18.
//

import Foundation
import UIKit

final class TopViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension TopViewController {
    func setupViews() {
        let button = makeButton(title: "InterfaceBuilderSample")
        button.addTarget(self, action: #selector(showViewController), for: .primaryActionTriggered)
        
        let button2 = makeButton(title: "NSConstraintSample")
        button2.addTarget(self, action: #selector(showNSConstraintSampleViewController), for: .primaryActionTriggered)
        
        let button3 = makeButton(title: "NSConstraintInterfaceBuilderSample")
        button3.addTarget(self, action: #selector(showNSConstraintInterfaceBuilderSampleViewController), for: .primaryActionTriggered)
        
        let button4 = makeButton(title: "CHCRSample")
        button4.addTarget(self, action: #selector(showCHCRSampleViewController), for: .primaryActionTriggered)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)

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
            scrollView.widthAnchor.constraint(equalTo: stackView.widthAnchor),

            // stackView
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
}

// MARK: Selector
private extension TopViewController {
    @objc func showViewController(sender: UIButton) {
        let vc = UIStoryboard(name: "InterfaceBuilderSample", bundle: nil).instantiateViewController(identifier: "InterfaceBuilderSample")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showNSConstraintSampleViewController(sender: UIButton) {
        let vc = NSConstraintSampleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showNSConstraintInterfaceBuilderSampleViewController(sender: UIButton) {
        let vc = UIStoryboard(name: "NSConstraintInterfaceBuilderSample", bundle: nil).instantiateViewController(identifier: "NSConstraintInterfaceBuilderSample") as NSConstraintInterfaceBuilderSampleViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showCHCRSampleViewController(sender: UIButton) {
        let vc = UIStoryboard(name: "CHCRSample", bundle: nil).instantiateViewController(identifier: "CHCRSample") as CHCRSampleViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
