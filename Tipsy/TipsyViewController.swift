//
//  TipsyViewController.swift
//  Tipsy
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import UIKit

class TipsyViewController: UIViewController {
  
  let billTextField: UITextField = {
    let textField = UITextField()
    textField.text = "e.g.123.56"
    textField.textColor = .black
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  let calculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Calculate", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 35.0)
    button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1) // 00B06B
    button.layer.cornerRadius = 10
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
    return button
  }()
  
  var buttons = [UIButton]()
  let splitNumberLabel: UILabel = {
    let label = UILabel()
    label.text = "2"
    label.font = .systemFont(ofSize: 35)
    label.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1) // 00B06B
    return label
  }()
  let stepper: UIStepper = {
    let stepper = UIStepper()
    stepper.value = 2
    stepper.minimumValue = 2
    stepper.maximumValue = 25
    stepper.stepValue = 1
    stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
    return stepper
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9776372313, green: 0.9993813634, blue: 0.9938063025, alpha: 1) // F8FFFD
    
    view.addSubview(calculateButton)
    calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    
    setupUI()
  }
  
  func setupUI() {
    
    setupButtons()
    let buttonsStack = UIStackView(arrangedSubviews: buttons)
    buttonsStack.axis = .horizontal
    buttonsStack.alignment = .fill
    buttonsStack.distribution = .fillEqually
    buttonsStack.spacing = 8.0
    let enterBillTotal = TipsyLabels()
    enterBillTotal.text = "Enter bill total"
    let selectTip = TipsyLabels()
    selectTip.text = "Select tip"
    let chooseSplit = TipsyLabels()
    chooseSplit.text = "Choose Split"
    
    let splitStack = UIStackView(arrangedSubviews: [splitNumberLabel, stepper])
    splitStack.axis = .horizontal
    splitStack.alignment = .fill
    splitStack.distribution = .fill
    splitStack.spacing = 27
    
    let stack = UIStackView(arrangedSubviews: [
      enterBillTotal,
      billTextField,
      selectTip,
      buttonsStack,
      chooseSplit,
      splitStack
    ])
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .equalSpacing
    stack.spacing = 20.0
    view.addSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    let margins = view.layoutMarginsGuide
    stack.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    stack.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

  }
  
  func setupButtons() {
    for i in 0..<3 {
      let button = UIButton(type: .system)
      button.setTitle("\(i * 10)%", for: .normal)
      button.titleLabel?.font = .systemFont(ofSize: 35.0)
      button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1) // 00B06B
      button.layer.cornerRadius = 10
      button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
      buttons.append(button)
    }
  }
  
  @objc func calculatePressed(_ sender: UIButton) {
    let controller = ResultViewController()
    self.present(controller, animated: true, completion: nil)
  }
  
  @objc func tipChanged(_ sender: UIButton) {
    
  }
  
  @objc func stepperValueChanged(_ sender: UIStepper) {
    splitNumberLabel.text = "\(Int(sender.value))"
  }
}

class TipsyLabels: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    font = .systemFont(ofSize: 25)
    textColor = .lightGray
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

