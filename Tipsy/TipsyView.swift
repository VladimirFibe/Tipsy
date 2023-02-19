import UIKit

final class TipsyView: UIView {
    var label = UILabel()
    var textField = UITextField()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layoutViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TipsyView {
    func setupViews() {
        addSubview(label)
        addSubview(textField)
    }
    
    func layoutViews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            label.heightAnchor.constraint(equalTo: textField.heightAnchor)
        ])
    }
    
    func configureAppearance() {
        label.backgroundColor = .cyan
        label.text = "Name"
        textField.backgroundColor = .green
        textField.placeholder = "Enter your name"
    }
}

