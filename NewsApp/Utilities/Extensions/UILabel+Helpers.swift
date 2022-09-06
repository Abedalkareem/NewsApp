//
//  Label.swift
//

import UIKit

extension UILabel {

  func setTextWithTypeAnimation(typedText: String, characterDelay: TimeInterval = 0.2) {
    text = ""
    let writingTask = DispatchWorkItem { [weak self] in
      for character in typedText {
        DispatchQueue.main.async {
          self?.text?.append(character)
        }
        Thread.sleep(forTimeInterval: characterDelay)
      }

      for i in 0...7 {
        DispatchQueue.main.async {
          if i % 2 == 0 {
            self?.text?.append("_")
          } else {
            self?.text?.removeLast()
          }
        }
        Thread.sleep(forTimeInterval: characterDelay)
      }
    }

    let queue = DispatchQueue(label: "typing.queue", qos: DispatchQoS.userInteractive)
    queue.async(execute: writingTask)
  }
}
