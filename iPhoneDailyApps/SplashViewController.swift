//
//  SplashViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/9/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

  
  @IBOutlet weak var webView: UIWebView!
  
  var globalVars: Globals!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "Splash Screen"
      let globalVars = Globals()
      
      // Loading a webView: http://stackoverflow.com/questions/26647447/load-local-html-into-uiwebview-using-swift
      let fileName = globalVars.SPLASH_SCREEN
      let filePath = NSBundle.mainBundle().pathForResource(globalVars.SPLASH_SCREEN, ofType: "html")
      let url = NSURL.fileURLWithPath(filePath!)
      let request = NSURLRequest(URL: url!)
      webView.loadRequest(request)
      
//      webView.loadHTMLString("hello", baseURL: nil)
    }

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
