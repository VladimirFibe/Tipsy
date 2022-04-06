//
//  TipsyViewController.swift
//  Tipsy
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import SwiftUI

class TipsyViewController: UIViewController {
  var brain = TipsyBrain()
  var selectedTip: Int? {
    didSet {
      calculateButton.isEnabled = selectedTip != nil
    }
  }
  
  let billTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "e.g.123.56"
    textField.keyboardType = .decimalPad
    textField.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1) // 00B06B
    textField.font = .systemFont(ofSize: 40)
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
    button.addTarget(nil, action: #selector(calculatePressed), for: .touchUpInside)
    button.isEnabled = false
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
    stepper.addTarget(nil, action: #selector(stepperValueChanged), for: .valueChanged)
    return stepper
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func updateTips() {
    for i in 0..<buttons.count {
      buttons[i].isSelected = i == selectedTip
    }
  }
  
  func setupUI() {
    view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 1, blue: 0.9921568627, alpha: 1) // F8FFFD
    let enterBillTotal = UILabel("Enter bill total")
    let selectTip = UILabel("Select tip")
    let chooseSplit = UILabel("Choose Split")

    let topStack = UIStackView(arrangedSubviews: [enterBillTotal, billTextField])
    topStack.axis = .vertical
    topStack.alignment = .fill
    topStack.distribution = .fill
    topStack.spacing = 26
    view.addSubview(topStack)
    topStack.translatesAutoresizingMaskIntoConstraints = false
    let margins = view.layoutMarginsGuide
    topStack.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    topStack.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    topStack.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    
    let mainView = UIView()
    view.addSubview(mainView)
    mainView.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1) // D7F9EB
    mainView.translatesAutoresizingMaskIntoConstraints = false
    mainView.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 40).isActive = true
    mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    view.addSubview(calculateButton)
    calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true

    setupButtons()
    let buttonsStack = UIStackView(arrangedSubviews: buttons)
    buttonsStack.axis = .horizontal
    buttonsStack.alignment = .fill
    buttonsStack.distribution = .fillEqually
    buttonsStack.spacing = 8.0
    
    let splitStack = UIStackView(arrangedSubviews: [splitNumberLabel, stepper])
    splitStack.axis = .horizontal
    splitStack.alignment = .fill
    splitStack.distribution = .equalSpacing
    splitStack.spacing = 27
    
    let stack = UIStackView(arrangedSubviews: [selectTip, buttonsStack, chooseSplit, splitStack])
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .equalSpacing
    stack.spacing = 26.0
    stack.translatesAutoresizingMaskIntoConstraints = false
    mainView.addSubview(stack)
    stack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
    stack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
    stack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
  }
  
  func setupButtons() {
    for i in 0..<3 {
      let button = UIButton(type: .system)
      button.setTitle("\(i * 10)%", for: .normal)
      button.titleLabel?.font = .systemFont(ofSize: 35.0)
      button.tintColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1) // 00B06B
      button.backgroundColor = .clear
      button.layer.cornerRadius = 10
      button.tag = i
      button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
      buttons.append(button)
    }
  }
  
  @objc func calculatePressed(_ sender: UIButton) {
    if let tip = selectedTip {
      brain.calculate(text: billTextField.text ?? "0.0", count: Int(stepper.value), tip: tip)
      let controller = ResultViewController()
      controller.value = brain.getResult()
      controller.tip = "\(tip * 10)"
      controller.count = "\(Int(stepper.value))"
      self.present(controller, animated: true, completion: nil)
    }
  }
  
  @objc func tipChanged(_ sender: UIButton) {
    billTextField.endEditing(true)
    selectedTip = sender.tag
    updateTips()
  }
  
  @objc func stepperValueChanged(_ sender: UIStepper) {
    splitNumberLabel.text = "\(Int(sender.value))"
  }
}

extension UILabel {
  convenience init(_ title: String = "") {
    self.init()
    text = title
    font = .systemFont(ofSize: 25)
    textColor = .lightGray
  }
}

struct SwiftUIController: UIViewControllerRepresentable {
  typealias UIViewControllerType = TipsyViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
}

struct SwiftUIController_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIController()
      .edgesIgnoringSafeArea(.all)
  }
}

