//
//  ViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 4/29/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  @IBOutlet weak var imageArea: UIImageView!
  @IBOutlet weak var psalmText: UIWebView!
  
  var global1: Globals!
  var psalmInfo: PsalmData!
  
//  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
//    init()
//  {
////    super.init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
////    super.init(coder: <#NSCoder#>)
//    global1 = Globals(sel: "PRODUCT_KJV")
//    var my_info_table = global1!.info_Table[1]
//    var my_IMAGE_DATA_XML = global1.IMAGE_DATA_XML
//    var my_QUOTE_DATA_XML = global1.QUOTE_DATA_XML
//    println("image_data_xml: \(my_IMAGE_DATA_XML) and quote_data_xml: \(my_QUOTE_DATA_XML)")
//    
//    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil: NSBundle?);
//  }
//
//  required init(coder aDecoder: NSCoder) {
//      fatalError("init(coder:) has not been implemented")
//  }

  
  @IBAction func topButton(sender: AnyObject) {
    psalmInfo.getNextQuoteIndex(nextQuote.Random)
    changeView()
//    println("-top button")
    
//    global1 = Globals(sel: "PRODUCT_KJV")
//    var my_info_table = global1!.info_Table[1]
//    var my_IMAGE_DATA_XML = global1.IMAGE_DATA_XML
//    var my_QUOTE_DATA_XML = global1.QUOTE_DATA_XML
//    println("image_data_xml: \(my_IMAGE_DATA_XML) and quote_data_xml: \(my_QUOTE_DATA_XML)")

  }
  
  @IBAction func rightButton(sender: UIButton) {
    psalmInfo.getNextQuoteIndex(nextQuote.Forward)
    changeView()
//    println("-right button")
  }
  
  @IBAction func infoButton(sender: UIButton) {
//    println("-info button")
  }
  
  @IBAction func leftButton(sender: UIButton) {
    psalmInfo.getNextQuoteIndex(nextQuote.Backward)
    changeView()
//    println("-left button")
  }
  
  func changeView(){
    psalmInfo = PsalmData.sharedInstance;
    // fetch quote
    let quote = psalmInfo.PsalmQuote()
    psalmText.loadHTMLString(quote, baseURL: nil)
    
    // fetch image
    let imageName = psalmInfo.PsalmImage() + ".jpg"// get image name
    let myImage = UIImage(named: imageName) // create UIImage object
    imageArea.image = myImage // place image
  } // end changeView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib. 
    
    // Test String
//    psalmText.loadHTMLString("Psalm 80:17 But let your hand be on the man of your right hand, the son of man whom you have made strong for yourself! 18 Then we shall not turn back from you; give us life, and we will call upon your name! 19 Restore us, O LORD God of hosts! Let your face shine, that we may be saved! <br>Image info:  SAN DIEGO (March 26, 2010) Machinist’s Mate 1st Class Jay Hinton mans the rails with his son and other Nimitz Sailors on the flight deck of the aircraft carrier USS Nimitz (CVN 68) as the ship transits into its homeport at Naval Base Coronado. Nimitz and embarked Carrier Air Wing (CVW) 11 returned after completing an eight-month deployment to the U.S. 5th Fleet and 7th Fleet areas of responsibility. (U.S. Navy photo by Mass Communication Specialist 3rd Class Nichelle Noelle Whitfield/Released)", baseURL: nil)
  
    
//    imageArea.image("deer02i.jpg")
//    let fileURL = NSBundle.mainBundle().URLForResource("BLM-rainbow04i", withExtension: "jpg")
//    let myImage1 = UIImage(data: fileURL)
//    let myImage = UIImage(contentsOfFile: "BLM-rainbow04i.jpg")
    
    // Set up singleton object for access to data
//    psalmInfo = PsalmData.sharedInstance;
    
    // set the first view
    changeView()
    
//    // fetch first quote of session
//    let quote = psalmInfo.PsalmQuote()
//    psalmText.loadHTMLString(quote, baseURL: nil)
//    
//    // fetch first image of the session
//    let imageName = psalmInfo.PsalmImage() // get image name
//    let myImage = UIImage(named: imageName) // create UIImage object
//    imageArea.image = myImage // place image
    
//    imageArea = UIImageView(image: myImage)
  } // end viewDidLoad
  
  override func viewWillAppear(animated: Bool) {
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(animated: Bool) {
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

