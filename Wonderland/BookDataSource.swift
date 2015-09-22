//
//  BookDataSource.swift
//  Wonderland
//
//  Created by John Alstru on 9/22/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class BookDataSource:NSObject, UIPageViewControllerDataSource {
  let paginator = Paginator(font: UIFont(name: "Times New Roman", size: 18.0)!)
  
  func load(# page: Int, pageViewController: UIPageViewController) -> OnePageViewController? {
    if page < 1 || !paginator.pageAvailable(page) {
      return nil
    }
    let controller = pageViewController.storyboard?.instantiateViewControllerWithIdentifier("OnePage") as! OnePageViewController
    controller.paginator = paginator
    controller.pageNumber = page
    
    return controller
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    if let pageController = viewController as? OnePageViewController {
      let pageBefore = pageController.pageNumber - 1
      return load(page: pageBefore, pageViewController: pageViewController)
    }
    return nil
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    if let pageController = viewController as? OnePageViewController {
      let pageAfter = pageController.pageNumber + 1
      return load(page: pageAfter, pageViewController: pageViewController)
    }
    return nil
  }
}
