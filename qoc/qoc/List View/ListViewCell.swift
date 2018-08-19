//
//  ListViewCell.swift
//  qoc
//
//  Created by Sivakumar Boju on 2018-08-17.
//  Copyright © 2018 Qoc Health. All rights reserved.
//

import UIKit

//  MARK: - Class
class ListViewCell: UICollectionViewCell {

  //  MARK: - Outlets
  @IBOutlet weak private var itemImageView:UIImageView!
  @IBOutlet weak private var itemLabel:UILabel!
  
  //  MARK: - Life Cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    self.initCell()
  }

  //  MARK: - Private Methods
  private func initCell() {
    self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    self.layer.borderWidth = 2
    self.itemImageView.layer.cornerRadius = 6
    self.itemImageView.clipsToBounds = true
    self.itemImageView.contentMode = .scaleAspectFill
  }
  
  //  MARK: - Public Methods
  func setupCell(entry:Entry){
    self.itemLabel.text = entry.name
    if let urlString = entry.images.first {
      self.itemImageView.imageFromServerURL(urlString: urlString)
      self.itemImageView.setNeedsDisplay()
    }
  }

}
