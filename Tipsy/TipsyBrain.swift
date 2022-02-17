//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import Foundation

struct TipsyBrain {
  var value = 0.0
  var count = 2
  var tip = 0
  var result: Double {
    (value * Double(tip) / 10.0) / Double(count)
  }
  mutating func calculate(text: String, count: Int, tip: Int) {
    self.value = Double(text) ?? 0.0
    self.count = count
    self.tip = tip
  }
  func getResult() -> String {
    String(format: "%.2f", result)
  }
}
