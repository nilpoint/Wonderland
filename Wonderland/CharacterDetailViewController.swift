//
//  CharacterDetailViewController.swift
//  Wonderland
//
//  Created by John Alstru on 9/21/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class CharacterDetailViewController : UIViewController {
  @IBOutlet var nameLabel : UILabel!
  @IBOutlet var imageView : UIImageView!
  @IBOutlet var descriptionView : UITextView!
  
  var characterInfo = [String: String]()
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    nameLabel.text = characterInfo[nameKey]
    imageView.image = UIImage(named: characterInfo[imageKey]!)
    descriptionView.text = characterInfo[descriptionKey]
  }
}
