//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    var player: AVAudioPlayer!
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer() //Timer is createed before button pressed
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate() //Clears all timers that are currently if any
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]! //To change a var just assign it with = and keep going
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        //Calls timer var and puts in information from secondsRemaining
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}
