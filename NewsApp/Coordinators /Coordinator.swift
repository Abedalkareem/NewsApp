//
//  Coordinator.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//


class Coordinator {
  
  // MARK: - Properties
  
  private(set) var coordinators: [Coordinator] = []
  
  // MARK: - Public methods

  func start() {
    preconditionFailure("This method needs to be overriden by concrete subclass.")
  }
  
  func finish() {
    preconditionFailure("This method needs to be overriden by concrete subclass.")
  }
  
  func addChild(_ coordinator: Coordinator) {
    coordinators.append(coordinator)
  }
  
  func removeChild(_ coordinator: Coordinator) {
    if let index = coordinators.firstIndex(of: coordinator) {
      coordinators.remove(at: index)
    } else {
      print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
    }
  }
  
  func removeAllChildCoordinators() {
    coordinators.removeAll()
  }
  
}

extension Coordinator: Equatable {
  
  static func == (ls: Coordinator, rs: Coordinator) -> Bool {
    return ls === rs
  }
  
}
