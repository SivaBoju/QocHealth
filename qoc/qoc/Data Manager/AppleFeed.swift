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
  let summary:String
  let publisher:String
  let price:String
  let category:String
  let releaseDate:String
  let link:String
  
  //  MARK: - Life Cycle
  init(name:String, images:[String],summary:String, publisher:String,price:String, category:String, releaseDate:String, link:String) {
    self.name = name
    self.images = images
    self.summary = summary
    self.publisher = publisher
    self.price = price
    self.category = category
    self.releaseDate = releaseDate
    self.link = link
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
          let entryImagesData = entry["im:image"] as? [[String:Any]],
          let summaryData = entry["summary"] as? [String: String],
          let publisherData = entry["title"] as? [String: String],
          let priceData = entry["im:price"] as? [String: Any],
          let categoryData = entry["category"] as? [String: Any],
          let attributesData = categoryData["attributes"] as? [String:String],
          let releaseData = entry["im:releaseDate"] as? [String: Any],
          let linkData = entry["link"] as? [String: Any],
          let entryName = entryNameData["label"],
          let summary = summaryData["label"],
          let publisher = publisherData["label"],
          let price = priceData["label"] as? String,
          let category = attributesData["label"],
          let releaseDate = releaseData["label"] as? String,
          let linkAttributes = linkData["attributes"] as? [String:String],
          let link = linkAttributes["href"]
          else {
            return nil
        }
        
        var images:[String] = []
        for entryImage in entryImagesData {
          images.append(entryImage["label"] as! String)
        }
        let entry = Entry(name: entryName, images: images, summary:summary, publisher: publisher,price:price, category:category, releaseDate:releaseDate, link: link)
        self.entries.append(entry)
      }
    }
  }
}
