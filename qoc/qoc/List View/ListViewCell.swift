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
  }
  
  //  MARK: - Public Methods
  func setupCell(imageName:String){
    if let image = UIImage(named: imageName) {
      itemImageView.image = image
      itemImageView.contentMode = .scaleAspectFill
      itemImageView.setNeedsDisplay()
    }
  }

}
