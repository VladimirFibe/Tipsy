import UIKit

class CalculatorViewController: UIViewController {
    let enterBillTotal = UILabel()
    let billTextField = UITextField()
    lazy var titleStack = UIStackView(arrangedSubviews: [enterBillTotal, billTextField])
    let optionsView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureAppearance()
    }
}

extension CalculatorViewController {
    func setupViews() {
        view.addSubview(titleStack)
        view.addSubview(optionsView)
    }
    
    func layoutViews() {
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        optionsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: titleStack.trailingAnchor, constant: 50),
            
            optionsView.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 40),
            optionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: optionsView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: optionsView.bottomAnchor)
        ])
    }
    
    func configureAppearance() {
        configureColos()
        enterBillTotal.text = "Enter bill total"
        enterBillTotal.font = .systemFont(ofSize: 25)
        enterBillTotal.textColor = .lightGray
        
        billTextField.placeholder = "e.g. 12356"
        billTextField.textAlignment = .center
        billTextField.font = .systemFont(ofSize: 40)
        
        titleStack.axis = .vertical
        titleStack.spacing = 26
    }
    
    func configureColos() {
        view.backgroundColor = #colorLiteral(red: 0.9776372313, green: 0.9993813634, blue: 0.9938063025, alpha: 1)
        enterBillTotal.textColor = .lightGray
        billTextField.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        optionsView.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
    }
}
