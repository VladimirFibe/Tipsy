import UIKit

class CalculatorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureAppearance()
    }
}

extension CalculatorViewController {
    func setupViews() {
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
        ])
    }
    
    func configureAppearance() {
        view.backgroundColor = #colorLiteral(red: 0.9776372313, green: 0.9993813634, blue: 0.9938063025, alpha: 1)
    }
}
