//
//  Extensions.swift
//  qoc
//
//  Created by Sivakumar Boju on 2018-08-17.
//  Copyright © 2018 Qoc Health. All rights reserved.
//

import UIKit

extension UIView {
  func loadViewFromNib(nibName:String) -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
    return view
  }
  
  func loadContentView(nibName:String)->UIView {
    let contentView = self.loadViewFromNib(nibName: nibName)
    contentView.backgroundColor = UIColor.clear
    contentView.frame = bounds
    contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    addSubview(contentView)
    return contentView
  }
  
}
