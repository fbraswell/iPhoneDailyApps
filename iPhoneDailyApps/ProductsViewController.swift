//
//  ProductsViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/11/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

      self.title = "Products"
      let globalVars = Globals()
      
      // Loading a webView: http://stackoverflow.com/questions/26647447/load-local-html-into-uiwebview-using-swift
      let fileName = globalVars.PRODUCTS_SCREEN
      let filePath = NSBundle.mainBundle().pathForResource(globalVars.PRODUCTS_SCREEN, ofType: "html")
      let url = NSURL.fileURLWithPath(filePath!)
      let request = NSURLRequest(URL: url!)
      webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
