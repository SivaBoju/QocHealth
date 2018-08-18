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

  //  MARK: - Outlets
  @IBOutlet weak private var appsCollectionView:UICollectionView!
  
  //  MARK: - Constants
  private let kImageCellIdentifier = "imageCell"
  private let kImageItemWidth:CGFloat = 80.0
  private let kImageItemHeight:CGFloat = 80.0
  private let kHeightGeneralCell:CGFloat = 80.0
  private let kHeightImageCell:CGFloat = 120.0

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
    self.setupCollectionView()
  }
  
  @IBAction func testUrl() {
    print("testing Url")
  }

}

//  MARK: - Collection View Extension
extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
  
  private func setupCollectionView() {
    appsCollectionView.delegate = self
    appsCollectionView.dataSource = self
    let nib = UINib(nibName: "ListViewCell", bundle: nil
    )
    appsCollectionView.register(nib, forCellWithReuseIdentifier: "ListCell")
    appsCollectionView.isUserInteractionEnabled = true
    DispatchQueue.main.async {
      self.appsCollectionView.reloadData()
    }
  }
  
  //  MARK: - Collection View Datasource Methods
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 36
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let listCell : ListViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListViewCell
    listCell.setupCell(imageName: "Boju")
    return listCell
  }
  
  //  MARK: - Collection View Layout Methods
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: kImageItemWidth, height: kImageItemHeight)
  }
  
  //  MARK: - Collection View Delegate Methods
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
    self.navigationController?.pushViewController(detailViewController, animated: true)
  }
  
}
