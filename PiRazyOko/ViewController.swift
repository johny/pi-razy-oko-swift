//
//  ViewController.swift
//  PiRazyOko
//
//  Created by Jan Kraus on 19/09/15.
//  Copyright © 2015 Jan Kraus Stanko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert() {
    
    // define alert controller
    let alert = UIAlertController(title: "Hello World", message: "This is my first alert app!", preferredStyle: .Alert)
    
    // define alert action button
    let action = UIAlertAction(title: "Ok, great!", style: .Default, handler: nil)
    
    // connect button to alert
    alert.addAction(action)
    
    // execute
    presentViewController(alert, animated: true, completion: nil)
    
  }


}

