//
//  ViewController.swift
//  SimonSays
//
//  Created by LIN2 on 6/6/19.
//  Copyright © 2019 LIN2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var simonLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    var siomTimer = Timer()
    var timeInt = 20
    var scoreInt = 0
    var gameInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeDown)
    }

    @IBAction func startGame(_ sender: Any) {
        
        if timeInt == 20 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.updateSiom()
            gameInt = 1
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.25
        }
        if timeInt == 0 {
            timeInt = 20
            scoreInt = 0
            timeLabel.text = String("Time: \(timeInt)")
            scoreLabel.text = String("Score: \(scoreInt)")
            startGameButton.setTitle("Start Game", for: UIControl.State.normal)
            
            
        }
        
    }
    
    @objc func updateTimer() {
        timeInt -= 1
        timeLabel.text = String("Time: \(timeInt)")
        if  timeInt == 0 {
            timer.invalidate()
            siomTimer.invalidate()
            simonLabel.text = "Game Over"
            startGameButton.isEnabled = true
            startGameButton.alpha = 1
            startGameButton.setTitle("Restart", for: UIControl.State.normal)
            gameInt = 0
        }
    }
    @objc func updateSiom() {
        let array = ["Simon Says Swipe Right",
                    "Simon Says Swipe Left",
                    "Simon Says Swipe Up",
                    "Simon Says Swipe Down",
                    "Swipe Right",
                    "Swipe Up",
                    "Swipe Down",
                    "Swipe Left"]
        let randomWord = Int(arc4random_uniform(UInt32(array.count)))
        simonLabel.text = array[randomWord]
        siomTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSiom), userInfo: nil, repeats: false)
    }
    @objc func swipeGestures(sender: UISwipeGestureRecognizer) {
        
        if gameInt == 1 {
            if sender.direction == .right {
                siomTimer.invalidate()
                if simonLabel.text == "Simon Says Swipe Right" {
                    scoreInt += 1
                    scoreLabel.text = String(scoreInt)
                    self.updateSiom()
                } else {
                    scoreInt -= 1
                    scoreLabel.text = String(scoreInt)
                    self.updateSiom()
                }
            }
            if sender.direction == .left {
                siomTimer.invalidate()
                if simonLabel.text == "Simon Says Swipe Left" {
                    scoreInt += 1
                    scoreLabel.text = String(scoreInt)
                    self.updateSiom()
                } else {
                    scoreInt -= 1
                    scoreLabel.text = String(scoreInt)
                    self.updateSiom()
                }
            }
            if sender.direction == .up {
                siomTimer.invalidate()
                if simonLabel.text == "Simon Says Swipe Up" {
                    scoreInt += 1
                    scoreLabel.text = String(scoreInt)
                    self.updateSiom()
                } else {
                    scoreInt -= 1
                    scoreLabel.text = String(scoreInt)
                    self.updateSiom()
                }
            }
            if sender.direction == .down {
                siomTimer.invalidate()
                if simonLabel.text == "Simon Says Swipe Down" {
                    scoreInt += 1
                    scoreLabel.text = String(scoreInt)
                    self.updateSiom()
                } else {
                    scoreInt -= 1
                    scoreLabel.text = String(scoreInt)
                    self.updateSiom()
                }
            }
            
        }
        
    }
    
}

