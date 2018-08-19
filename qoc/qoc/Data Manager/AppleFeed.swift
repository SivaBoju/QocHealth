//
//  AppleFeed.swift
//  qoc
//
//  Created by Sivakumar Boju on 2018-08-19.
//  Copyright © 2018 Qoc Health. All rights reserved.
//

import Foundation

//  MARK: - Struct
struct Author {
  //  MARK: - Properties
  let name:String
  let uri:String
  //  MARK: - Life Cycle
  init(name:String, uri:String) {
    self.name = name
    self.uri = uri
  }
}

//  MARK: - Struct
struct Entry {
  //  MARK: - Properties
  let name:String
  let images:[String]
  //  MARK: - Life Cycle
  init(name:String, images:[String]) {
    self.name = name
    self.images = images
  }
}

//  MARK: - Struct
struct AppleFeed {
  //  MARK: - Properties
  let author: Author
  var entries:[Entry]
  
  //  MARK: - Life Cycle
  init?(json: [String:Any]) {
    
    //  extract author name and uri
    guard let authorData = json["author"] as? [String: Any],
      let authorNameData = authorData["name"] as? [String: String],
      let authorName = authorNameData["label"],
      let authorUriData = authorData["uri"] as? [String: String],
      let authorUri = authorUriData["label"]
      else {
        return nil
    }
    self.author = Author(name: authorName, uri: authorUri)
    
    //  extract entry name and images
    self.entries = []
    if let entryData = json["entry"] as? [[String:Any]] {
      for entry in entryData {
        guard
          let entryNameData = entry["im:name"] as? [String: String],
          let entryName = entryNameData["label"],
          let entryImagesData = entry["im:image"] as? [[String:Any]]
          else {
            return nil
        }
        
        var images:[String] = []
        for entryImage in entryImagesData {
          images.append(entryImage["label"] as! String)
        }
        let entry = Entry(name: entryName, images: images)
        self.entries.append(entry)
      }
    }
  }
}
