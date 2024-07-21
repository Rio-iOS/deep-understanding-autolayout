//
//  TopViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/19.
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
        let button = makeButton(title: "ViewControllerSample")
        button.addTarget(self, action: #selector(showViewController), for: .primaryActionTriggered)
        
        let button2 = makeButton(title: "ViewLifeCycleSample")
        button2.addTarget(self, action: #selector(showViewLifeCycleSampleViewController), for: .primaryActionTriggered)
        
        let button3 = makeButton(title: "LayoutSubViewSampleView")
        button3.addTarget(self, action: #selector(showLayoutSubViewSampleViewController), for: .primaryActionTriggered)
        
        let button4 = makeButton(title: "ScrollViewSample")
        button4.addTarget(self, action: #selector(showScrollViewSampleViewController), for: .primaryActionTriggered)
        
        let button5 = makeButton(title: "ScrollViewUsingLayoutSubViewsSample")
        button5.addTarget(self, action: #selector(showScrollViewUsingLayoutSubViewsSampleViewController), for: .primaryActionTriggered)
        
        let button6 = makeButton(title: "RenderingSumple")
        button6.addTarget(self, action: #selector(showRenderingSumpleViewController), for: .primaryActionTriggered)
        
        let button7 = makeButton(title: "ViewControllerLifeCycleSample")
        button7.addTarget(self, action: #selector(showViewControllerLifeCycleSampleViewController), for: .primaryActionTriggered)
        
        let button8 = makeButton(title: "UIStackViewSample")
        button8.addTarget(self, action: #selector(showUIStackViewSampleViewController), for: .primaryActionTriggered)
        
        let button9 = makeButton(title: "UIStackViewSample2")
        button9.addTarget(self, action: #selector(showUIStackViewSample2ViewController), for: .primaryActionTriggered)
        
        let button10 = makeButton(title: "UIStackViewAutoLayoutSample")
        button10.addTarget(self, action: #selector(showUIStackViewAutoLayoutSampleViewController), for: .primaryActionTriggered)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        stackView.addArrangedSubview(button5)
        stackView.addArrangedSubview(button6)
        stackView.addArrangedSubview(button7)
        stackView.addArrangedSubview(button8)
        stackView.addArrangedSubview(button9)
        stackView.addArrangedSubview(button10)

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
        let vc = UIStoryboard(name: "ViewControllerSample", bundle: nil).instantiateViewController(identifier: "ViewControllerSample")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showViewLifeCycleSampleViewController(sender: UIButton) {
        let vc = ViewLifeCycleSampleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showLayoutSubViewSampleViewController(sender: UIButton) {
        let vc = LayoutSubViewSampleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showScrollViewSampleViewController(sender: UIButton) {
        let vc = ScrollViewSampleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showScrollViewUsingLayoutSubViewsSampleViewController(sender: UIButton) {
        let vc = ScrollViewUsingLayoutSubViewsSampleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showRenderingSumpleViewController(sender: UIButton) {
        let vc = RenderingSumpleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showViewControllerLifeCycleSampleViewController(sender: UIButton) {
        let vc = ViewControllerLifeCycleSampleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showUIStackViewSampleViewController(sender: UIButton) {
        let vc = UIStoryboard(name: "UIStackViewSample", bundle: nil).instantiateViewController(identifier: "UIStackViewSample")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showUIStackViewSample2ViewController(sender: UIButton) {
        let vc = UIStackViewSample2ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showUIStackViewAutoLayoutSampleViewController(sender: UIButton) {
        let vc = UIStoryboard(name: "UIStackViewAutoLayoutSample", bundle: nil).instantiateViewController(identifier: "UIStackViewAutoLayoutSample")
        navigationController?.pushViewController(vc, animated: true)
    }
}
