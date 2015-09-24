//
//  BookViewController.swift
//  Wonderland
//
//  Perform some initial setup of the page view controller and data model when the page view controller is created.
//
//  Created by John Alstru on 9/22/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class BookViewController: UIPageViewController {
  let bookSource = BookDataSource()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let textURL = NSBundle.mainBundle().URLForResource("Alice", withExtension: "txt") {
      bookSource.paginator.bookText = NSString(contentsOfURL: textURL, encoding: NSUTF8StringEncoding, error: nil)!
    }
    
    // Makes the bookSource object the data source for the page view controller
    dataSource = bookSource
    
    // It creates the initial view controller that the page view controller will present by explicitly creating the controller for page 1. 
    // This must be done programmatically before the page view controller appears.
    let firstPage = bookSource.load(page: 1, pageViewController: self)!
    setViewControllers([firstPage], direction: .Forward, animated: false, completion: nil)
  }
  
  // MARK: Change font by traitcollection
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    adaptViewsToTraitCollection(traitCollection)
  }
  
  override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    adaptViewsToTraitCollection(newCollection);
  }
  
  func adaptViewsToTraitCollection(traits: UITraitCollection) {
    let compactWidth = ( traitCollection.horizontalSizeClass == .Compact )
    
    var fontSize: CGFloat = 18.0
    if compactWidth {
      fontSize = 14.0
    }
    let paginator = bookSource.paginator
    let currentFont = paginator.font
    if currentFont.pointSize != fontSize {
      paginator.font = currentFont.fontWithSize(fontSize)
    }
  }
}
