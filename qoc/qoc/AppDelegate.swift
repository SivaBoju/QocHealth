//
//  AppDelegate.swift
//  qoc
//
//  Created by Sivakumar Boju on 2018-08-17.
//  Copyright © 2018 Qoc Health. All rights reserved.
//

import UIKit

//  MARK: - Class
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  //  MARK: - Properties
  var window: UIWindow?
  var isAuthorizedDevice:Bool = false
  
  //  MARK: - Life Cycle
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    //  verify if the device is jail broken
    self.isAuthorizedDevice = application.isJailbroken()
    return true
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    //  add splash view
    //  to hide application active screen
    let splashView = UIImageView(frame: UIScreen.main.bounds)
    splashView.tag = 999
    splashView.image = Asset.splash.image
    window?.addSubview(splashView)
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    //  remove splash view
    //  to reveal application active screen
    if let view = window?.viewWithTag(999) {
      view.removeFromSuperview()
    }
  }
}

