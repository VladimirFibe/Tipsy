//
//  TipsyViewController.swift
//  Tipsy
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import UIKit

class TipsyViewController: UIViewController {
  let calculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Calculate", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20.0)
    button.backgroundColor = #colorLiteral(red: 0.3843137255, green: 0.3764705882, blue: 0.6156862745, alpha: 1) // 62609D
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 51.0).isActive = true
    button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9776372313, green: 0.9993813634, blue: 0.9938063025, alpha: 1) // F8FFFD
    view.addSubview(calculateButton)
    calculateButton.translatesAutoresizingMaskIntoConstraints = false
    calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
  }
  
  @objc func calculatePressed(_ sender: UIButton) {
    let controller = ResultViewController()
    self.present(controller, animated: true, completion: nil)
  }
}
