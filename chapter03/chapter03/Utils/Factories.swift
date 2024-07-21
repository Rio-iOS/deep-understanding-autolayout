//
//  Factories.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/19.
//

import Foundation
import UIKit

func makeButton(title: String) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setTitleColor(.black, for: .normal)
    return button
}
