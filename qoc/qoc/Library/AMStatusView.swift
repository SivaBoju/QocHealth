//
//  AMStatusView.swift
//  AMLibrary
//
//  Created by Boju, Sivakumar on 2018-06-15.
//  Copyright © 2018 QoC Health. All rights reserved.
//

import UIKit

//  MARK: - Class
public class AMStatusView: UIView {
  
  //  MARK: - Outlets
  @IBOutlet private var contentView:UIView!
  @IBOutlet private weak var statusImageView: UIImageView!
  @IBOutlet private weak var headLabel: UILabel!
  @IBOutlet private weak var subheadLabel: UILabel!
  
  //  MARK: - Constants
  private let nibName = "AMStatusView"
  private let timeInterval:TimeInterval = TimeInterval(3.0)
  private var timer:Timer?
  
  //  MARK: - Life Cycle
  public override init(frame: CGRect) {
    super.init(frame:frame)
    self.setupView()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setupView()
  }
  
  convenience init(frame:CGRect, image:UIImage, headline:String, subheading:String) {
    self.init(frame: frame)
    self.set(image: image)
    self.set(headline: headline)
    self.set(subheading: subheading)
  }
  
  public override func layoutSubviews() {
    // Rounded corners with border
    self.layoutIfNeeded()
    self.contentView.layer.masksToBounds = true
    self.contentView.clipsToBounds = true
    self.contentView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    self.contentView.layer.borderWidth = 2
    self.contentView.layer.cornerRadius = 10
  }

  public override func didMoveToSuperview() {
    // Fade in when added to superview
    // Then add a timer to remove the view
    self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    UIView.animate(withDuration: 0.15, animations: {
      self.contentView.alpha = 1.0
      self.contentView.transform = CGAffineTransform.identity
    }) { _ in
      self.timer = Timer.scheduledTimer(
        timeInterval: self.timeInterval,
        target: self,
        selector: #selector(self.removeSelf),
        userInfo: nil,
        repeats: false)
    }
  }

  //  MARK: - Private Methods
  private func setupView() {
    //  setup content view
    let bundle = Bundle(for: type(of:self))
    let nib = UINib(nibName: self.nibName, bundle: bundle)
    let contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
    addSubview(contentView)
    
    //  setup autoresizing mask
    contentView.center = self.center
    contentView.autoresizingMask = []
    contentView.translatesAutoresizingMaskIntoConstraints = true
    
    //  setup labels and image
    headLabel.text = ""
    subheadLabel.text = ""
    statusImageView.image = nil
  }
  
  @objc private func removeSelf() {
    // Animate removal of view
    UIView.animate(
      withDuration: 0.15,
      animations: {
        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        self.contentView.alpha = 0.0
    }) { _ in
      self.removeFromSuperview()
    }
  }

  //  MARK: - Public Methods
  public func set(image:UIImage) {
    self.statusImageView.image = image
  }
  
  public func set(headline text:String) {
    self.headLabel.text = text
  }
  
  public func set(subheading text:String) {
    self.subheadLabel.text = text
  }
  
}

