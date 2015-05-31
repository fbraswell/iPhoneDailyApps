//
//  SplashViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/9/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

  
//  @IBOutlet weak var webView: UIWebView!
  @IBOutlet weak var imageView: UIImageView!
  
  var globalVars: Globals!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "Splash Screen"      
      // Loading a webView: http://stackoverflow.com/questions/26647447/load-local-html-into-uiwebview-using-swift

    }
  
  override func viewWillAppear(animated: Bool) {
    let globalVars = Globals()
    let imageName = globalVars.SPLASH_SCREEN_IMAGE
    let myImage = UIImage(named: imageName)
    imageView.image = myImage
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
