//
//  ListViewController.swift
//  qoc
//
//  Created by Sivakumar Boju on 2018-08-17.
//  Copyright © 2018 Qoc Health. All rights reserved.
//

import UIKit

//  MARK: - Class
class ListViewController: UIViewController {

  //  MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.initScreen()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //  MARK: - Private Methods
  private func initScreen() {
    self.title = L10n.titleListView.string
  }

}
