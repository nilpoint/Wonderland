//
//  FirstViewController.swift
//  Wonderland
//
//  Created by John Alstru on 9/20/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIAdaptivePresentationControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "info" {
      let presented = segue.destinationViewController as? UIViewController
      let presentationController = presented?.presentationController
      presentationController?.delegate = self
    } else {
      super.prepareForSegue(segue, sender: sender)
    }
  }
  
  // MARK: UIAdaptivePresentationControllerDelegate
  
  func presentationController(controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
    let presentedVC = controller.presentedViewController
    let replacementController = UINavigationController(rootViewController: presentedVC)
    let navigationItem = presentedVC.navigationItem
    let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "dismissInfo:")
    navigationItem.rightBarButtonItem = doneButton
    navigationItem.title = "Author"
    return replacementController
  }
  
  @IBAction func dismissInfo(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
    // Don’t adapt the interface. Present it exactly as it was requested.
    //return .None
    
    return .FullScreen
  }
}

