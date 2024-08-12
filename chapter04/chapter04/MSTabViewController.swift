//
//  MSTabViewController.swift
//  chapter04
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

class MSTabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        guard
            let vc1 = UIStoryboard.sub1Storyboard().instantiateInitialViewController(),
            let vc2 = UIStoryboard.sub2Storyboard().instantiateInitialViewController()
        else {
            return
        }
        
        vc1.tabBarItem = .init(title: "MSSub1", image: nil, tag: 1)
        vc2.tabBarItem = .init(title: "MSSub2", image: nil, tag: 2)
        
        viewControllers = [vc1, vc2]
    }
}

private extension UIStoryboard {
    static func sub1Storyboard() -> UIStoryboard {
        UIStoryboard(name: "MSSub1", bundle: nil)
    }
    
    static func sub2Storyboard() -> UIStoryboard {
        UIStoryboard(name: "MSSub2", bundle: nil)
    }
}
