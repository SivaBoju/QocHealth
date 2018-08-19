//
//  AppInfoProvider.swift
//  qoc
//
//  Created by Sivakumar Boju on 2018-08-18.
//  Copyright © 2018 Qoc Health. All rights reserved.
//

import Foundation

//  MARK: - Class
struct AppInfoProvider {

  //  MARK: - Life Cycle
  fileprivate init() {
    //  init not allowed
  }
  
  //  MARK: - Properties
  internal static let appName:String = {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
  }()

  internal static let version:String = {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
  }()

  internal static let build:String = {
    return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
  }()
  
}
