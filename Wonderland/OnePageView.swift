//
//  OnePageView.swift
//  Wonderland
//
//  Created by John Alstru on 9/22/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class OnePageView: UIView {
  var text: NSString = "" { didSet { setNeedsDisplay() } }
  var fontAttrs: [String: AnyObject]! = nil
  
  override func drawRect(rect: CGRect) {
    super.drawRect(rect)
    text.drawInRect(bounds, withAttributes: fontAttrs)
  }
}
