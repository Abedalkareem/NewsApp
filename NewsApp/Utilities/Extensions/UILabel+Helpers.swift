//
//  Label.swift
//

import UIKit

extension UILabel {

  func setTextWithTypeAnimation(typedText: String, characterDelay: TimeInterval = 5.0) {
    text = ""
    var writingTask: DispatchWorkItem?
    writingTask = DispatchWorkItem { [weak weakSelf = self] in
      for character in typedText {
        DispatchQueue.main.async {
          weakSelf?.text!.append(character)
        }
        Thread.sleep(forTimeInterval: characterDelay / 100)
      }

      for i in 0...7 {
        DispatchQueue.main.async {
          if i % 2 == 0 {
            weakSelf?.text!.append("_")
          } else {
            weakSelf?.text!.removeLast()
          }
        }
        Thread.sleep(forTimeInterval: characterDelay / 20)
      }
    }

    if let task = writingTask {
      let queue = DispatchQueue(label: "typespeed", qos: DispatchQoS.userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: task)
    }
  }
}
