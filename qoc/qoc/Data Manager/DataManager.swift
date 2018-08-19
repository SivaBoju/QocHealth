//
//  DataManager.swift
//  qoc
//
//  Created by Sivakumar Boju on 2018-08-18.
//  Copyright © 2018 Qoc Health. All rights reserved.
//

import Foundation

//  MARK: - Enum
enum DataManagerErrorType: String {
  case failedApi
  case failedToParseJson
  case emptyData
}

//  MARK: - Protocol
protocol  DataManagerDelegate:class  {
  func didFetchAppleFeed(feed:AppleFeed)
  func didFailedAppleFeed(error:DataManagerErrorType)
}

//  MARK: - Class
class DataManager:NSObject {

  //  MARK: - Properties
  private var feed:AppleFeed?
  weak var delegate:DataManagerDelegate?

  //  MARK: - Life Cycle
  override init() {
    super.init()
  }

  //  MARK: - Private Methods
  func popuateData(feedData:[String:Any]) {
    if let feed:AppleFeed = AppleFeed(json: feedData["feed"] as! [String : Any]) {
      self.feed = feed
      self.delegate?.didFetchAppleFeed(feed: feed)
    }
  }

  //  MARK: - Public Methods
  func getTopApps() {
    let getURL = URL(string: "http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=100/json")!
    var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
    getRequest.httpMethod = "GET"
    getRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    getRequest.setValue("application/json", forHTTPHeaderField: "Accept")
    
    URLSession.shared.dataTask(with: getRequest, completionHandler: { (data, response, error) -> Void in
      
      //  handle error
      if error != nil {
        DispatchQueue.main.async(execute: {
          self.delegate?.didFailedAppleFeed(error: DataManagerErrorType.failedApi)
        })
      }
      if data != nil {
        do {
          let jsonData = try JSONSerialization.jsonObject(with: data!, options: [])
          DispatchQueue.main.async(execute: {
            if let feedData = jsonData as? [String: Any] {
              self.popuateData(feedData: feedData)
            }
          })
        } catch {
          DispatchQueue.main.async(execute: {
            self.delegate?.didFailedAppleFeed(error: DataManagerErrorType.failedToParseJson)
          })
        }
      } else {
        DispatchQueue.main.async(execute: {
          self.delegate?.didFailedAppleFeed(error: DataManagerErrorType.emptyData)
        })
      }
    }).resume()
  }
  
}
