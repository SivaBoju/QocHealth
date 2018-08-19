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
  @IBOutlet weak private var infoLabel:UILabel!

  //  MARK: - Constants
  private let kImageCellIdentifier = "imageCell"
  private let kImageItemWidth:CGFloat = 120.0
  private let kImageItemHeight:CGFloat = 120.0

  //  MARK: - Properties
  private let manager:DataManager = DataManager()
  private var feed:AppleFeed?
  
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
    self.setupAppInfo()
    self.setupDataManager()
    self.setupCollectionView()
  }
  
  private func setupAppInfo() {
    self.infoLabel.text = "\(AppInfoProvider.appName)_v\(AppInfoProvider.version)_b\(AppInfoProvider.version)"
  }
  
  private func setupStatusView() {
    let logo = UIImage(named: "logoQoc")
    let statusView:AMStatusView = AMStatusView(frame: self.view.bounds, image: logo!, headline: L10n.statusHeadline.string, subheading: L10n.statusSubHeadLine.string)
    self.view.addSubview(statusView)
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
    var numberOfItems = 0
    if let feed = self.feed {
      numberOfItems = feed.entries.count
    }
    return numberOfItems
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let listCell : ListViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListViewCell
    if let feed = self.feed {
      let entry:Entry = feed.entries[indexPath.row]
      listCell.setupCell(entry: entry)
    }
    return listCell
  }
  
  //  MARK: - Collection View Layout Methods
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.appsCollectionView.frame.width / 4, height: kImageItemHeight)
  }
  
  //  MARK: - Collection View Delegate Methods
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
    if let feed = self.feed {
      detailViewController.entry = feed.entries[indexPath.row]
    }
    self.navigationController?.pushViewController(detailViewController, animated: true)
  }
  
}

//  MARK: - Data Manager Delegate Extension
extension ListViewController: DataManagerDelegate {
  
  func setupDataManager() {
    self.manager.delegate = self
    self.setupStatusView()
    self.manager.getTopApps()
  }
  
  func didFetchAppleFeed(feed: AppleFeed) {
    self.feed = feed
    self.appsCollectionView.reloadData()
  }
  
  func didFailedAppleFeed(error: DataManagerErrorType) {
    switch error {
    case .emptyData:
      self.infoLabel.text = L10n.failedData.string
    default:
      self.infoLabel.text = L10n.failedMisc.string
    }
  }
}
