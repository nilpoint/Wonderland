//
//  OnePageViewController.swift
//  Wonderland
//
//  The OnePageViewController is really just “glue” between its OnePageView and the Paginator.
//
//  Created by John Alstru on 9/22/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class OnePageViewController: UIViewController {
  @IBOutlet var textView: OnePageView!
  @IBOutlet var pageLabel: UILabel!
  
  var pageNumber = 1
  var paginator: Paginator? = nil
  
  func loadPageContent() {
    if let tv = textView {
      if let pager = paginator {
        // configure paginator with the actual size of the text view
        pager.viewSize = tv.bounds.size
        if !pager.pageAvailable(pageNumber) {
          pageNumber = pager.lastKnownPage
        }
        tv.fontAttrs = pager.fontAttrs
        tv.text = pager.textForPage(pageNumber)
      }
    }
    pageLabel.text = "Page \(pageNumber)"
  }
  
  override func viewDidLayoutSubviews() {
    loadPageContent()
  }
}
