//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import UIKit

class ResultViewController: UIViewController {
  let recalculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("RECALCULATE", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20.0)
    button.tintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1) // 7472D2
    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 51.0).isActive = true
    button.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
    view.addSubview(recalculateButton)
    recalculateButton.translatesAutoresizingMaskIntoConstraints = false
    recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true

  }
  @objc func recalculatePressed(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
}
