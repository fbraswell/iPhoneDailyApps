//
//  HelpInfoViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/9/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit

class HelpInfoViewController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
  }

  override func viewWillAppear(animated: Bool) {
    self.title = "Help Information"
    
    let globalVars = Globals()
    
    // Loading a webView: http://stackoverflow.com/questions/26647447/load-local-html-into-uiwebview-using-swift
    let fileName = globalVars.HELP_SCREEN
    let filePath = NSBundle.mainBundle().pathForResource(globalVars.HELP_SCREEN, ofType: "html")
    let url = NSURL.fileURLWithPath(filePath!)
    let request = NSURLRequest(URL: url!)
    webView.loadRequest(request)
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
