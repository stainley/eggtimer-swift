//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var time: Timer = Timer()
    
    var progress: Float = 0.1
    var totalTime = 0
    var secondPassed = 0
  
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        time.invalidate()
  
        let hardness: String = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        message.text = hardness
        progressBar.progress = 0.0
        secondPassed = 0
        
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
    
        if secondPassed < totalTime {
            secondPassed += 1

            let percentageProgress = Float(secondPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
        } else  {
            time.invalidate()
            message.text = "DONE!"
        }
    }

}
