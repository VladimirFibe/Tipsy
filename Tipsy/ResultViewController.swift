//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import UIKit

class ResultViewController: UIViewController {
  var value = ""
  var count = "2"
  var tip = "10"
  let totalLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 45)
    label.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1) // 00B06B
    return label
  }()
  let settingsLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 25)
    label.textColor = #colorLiteral(red: 0.5843137255, green: 0.6039215686, blue: 0.6, alpha: 1) // 959A99
    return label
  }()
  let recalculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Recalculate", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 35.0)
    button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1) // 00B06B
    button.layer.cornerRadius = 10
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(nil, action: #selector(recalculatePressed), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func setupUI() {
    totalLabel.text = value
    settingsLabel.text = "Split between \(count) people, with \(tip)% tip."

    let stack = UIStackView(arrangedSubviews: [totalLabel, settingsLabel])
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .fill
    stack.spacing = 20
    view.addSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    let margins = view.layoutMarginsGuide
    stack.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    stack.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    view.backgroundColor = #colorLiteral(red: 0.9776372313, green: 0.9993813634, blue: 0.9938063025, alpha: 1) // F8FFFD
    view.addSubview(recalculateButton)
    recalculateButton.translatesAutoresizingMaskIntoConstraints = false
    recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
  }
  
  @objc func recalculatePressed(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
}
