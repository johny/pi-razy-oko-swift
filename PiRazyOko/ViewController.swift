//
//  ViewController.swift
//  PiRazyOko
//
//  Created by Jan Kraus on 19/09/15.
//  Copyright © 2015 Jan Kraus Stanko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  @IBOutlet weak var actionButton: UIButton!
  
  let initialValue = 500
  
  var currentRound = 0
  var currentValue = 0
  var targetValue = 0
  var playerScore = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    resetGame()
    
    actionButton.layer.cornerRadius = 20.0
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // reset values for new round
  func startNewRound() {
    currentRound += 1
    currentValue = initialValue
    slider.value = Float(initialValue)
    targetValue = 1 + Int(arc4random_uniform(1000))
  }
  
  // update labels
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(playerScore)
    roundLabel.text = String(currentRound)
  }
  
  
  
  // handle touch on main button
  @IBAction func showAlert() {
    
    let difference = abs(currentValue - targetValue)
    var points = 1000 - difference
    
    var alertTitle: String
    
    if difference == 0 {
      alertTitle = "Wow! Perfekcyjnie!"
      points += 100
    } else if difference < 10 {
      alertTitle = "Extra! Prawie to masz!"
    } else if difference < 50 {
      alertTitle = "Brawo! Naprawdę dobrze!"
    } else if difference < 100 {
      alertTitle = "Ok! Dobry wynik!"
    } else {
      alertTitle = "Może następnym razem..."
    }
    
    playerScore += points
    
    let message = "Ustawiono: \(currentValue)\n"
                + "Zdobyte punkty: \(points)"
    
    // define alert controller
    let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .Alert)
    
    // define alert action button
    let action = UIAlertAction(title: "Jeszcze raz!", style: .Default,
                               handler: { action in
                                 self.startNewRound()
                                 self.updateLabels()
                               })
    
    // connect button to alert
    alert.addAction(action)
    
    // execute
    presentViewController(alert, animated: true, completion: nil)
    
  }
  
  // handle slider change
  @IBAction func sliderMoved(slider: UISlider) {
    
    // get the value from the slider, round it
    currentValue = lroundf(slider.value)
    
  }
  
  
  @IBAction func resetGame() {
    
    currentRound = 0
    playerScore = 0
    
    
    startNewRound()
    updateLabels()
    
  }


}

