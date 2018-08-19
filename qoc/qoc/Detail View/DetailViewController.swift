//
//  DetailViewController.swift
//  qoc
//
//  Created by Sivakumar Boju on 2018-08-17.
//  Copyright © 2018 Qoc Health. All rights reserved.
//

import UIKit

//  MARK: - Class
class DetailViewController: UIViewController {

  //  MARK: - Properties
  var entry:Entry?

  //  MARK: - Outlets
  @IBOutlet weak private var nameLabel:UILabel!
  @IBOutlet weak private var publisherLabel:UILabel!
  @IBOutlet weak private var iconImageView:UIImageView!
  @IBOutlet weak private var priceLabel:UILabel!
  @IBOutlet weak private var releaseDateTitleLabel:UILabel!
  @IBOutlet weak private var releaseDateLabel:UILabel!
  @IBOutlet weak private var categoryTitleLabel:UILabel!
  @IBOutlet weak private var categoryLabel:UILabel!
  @IBOutlet weak private var summaryLabel:UILabel!
  @IBOutlet weak private var summaryTextView:UITextView!
  @IBOutlet weak private var linkTextView:UITextView!


  //  MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupDetails()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //  MARK: - Private Methods
  private func setupDetails() {
    self.title = L10n.titleDetailView.string
    self.summaryLabel.text = L10n.titleSummary.string
    self.categoryTitleLabel.text = L10n.titleCategory.string
    self.releaseDateTitleLabel.text = L10n.titleReleaseDate.string
    self.iconImageView.layer.cornerRadius = 6
    self.iconImageView.clipsToBounds = true
    self.iconImageView.contentMode = .scaleAspectFill

    if let entry = self.entry {
      self.nameLabel.text = entry.name
      self.publisherLabel.text = entry.publisher
      self.summaryTextView.text = entry.summary
      if let urlString = entry.images.last {
        self.iconImageView.imageFromServerURL(urlString: urlString)
        self.iconImageView.setNeedsDisplay()
      }
      self.categoryLabel.text = entry.category
      self.priceLabel.text = entry.price
      if let formattedDate = entry.releaseDate.toDate(fromFormat: "yyyy-MM-dd'T'HH:mm:ssZZZZZ", toFormat: "MM/dd/yyyy") {
        self.releaseDateLabel.text = formattedDate
      }
      else {
        self.releaseDateLabel.text = entry.releaseDate
      }
      self.linkTextView.text = entry.link
    }
  }

}
