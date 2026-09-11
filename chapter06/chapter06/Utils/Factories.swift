import Foundation
import UIKit

func makeButton(title: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.setTitleColor(.black, for: .normal)
    return button
}
