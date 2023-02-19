import UIKit

extension UILabel {
    convenience init(_ title: String = "") {
        self.init()
        text = title
        font = .systemFont(ofSize: 25)
        textColor = .lightGray
    }
}
