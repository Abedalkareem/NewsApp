//
//  AppDelegate.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 6/16/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Shared
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private var appCoordinator: AppCoordinator?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    LocalizationHelper.defaultLanguage = .en

    Utilities.setAppStyle()

    LoadingHelper.setup()

    startRootViewController()

    return true
  }

  private func startRootViewController() {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    appCoordinator = AppCoordinator(window: window)
    appCoordinator?.start()
  }

  func applicationWillResignActive(_ application: UIApplication) { }

  func applicationDidEnterBackground(_ application: UIApplication) { }

  func applicationWillEnterForeground(_ application: UIApplication) { }

  func applicationDidBecomeActive(_ application: UIApplication) { }

  func applicationWillTerminate(_ application: UIApplication) { }

}
