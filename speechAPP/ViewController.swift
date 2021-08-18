//
//  ViewController.swift
//  speechAPP
//
//  Created by 王昱淇 on 2021/8/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var speechTextField: UITextField!

    @IBOutlet weak var rateSlider: UISlider!

    @IBOutlet weak var pitchSlider: UISlider!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var pitchLabel: UILabel!
    
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    let synthesizer = AVSpeechSynthesizer()
    var isPlaying = false
    
    @IBAction func speech(_ sender: Any) {
        
        let speechUtterance = AVSpeechUtterance(string: speechTextField.text!)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        
       
        speechUtterance.rate = rateSlider.value
      
        speechUtterance.pitchMultiplier = pitchSlider.value
        
        speechUtterance.volume = volumeSlider.value
        
        synthesizer.speak(speechUtterance)
        
        let speedNumber: String = String(format: "%.1f", rateSlider.value)
        speedLabel.text = speedNumber
        
        let pitchNumber: String = String(format: "%.1f", pitchSlider.value)
        pitchLabel.text = pitchNumber
            
        let volumeNumber: String = String(format: "%.1f", volumeSlider.value)
        volumeLabel.text = volumeNumber
        
        isPlaying = true
        }
        
    
  
    @IBAction func pauseButton(_ sender: Any) {
        if isPlaying == false
        {
            return
        }
        
        synthesizer.pauseSpeaking(at:AVSpeechBoundary.immediate)
        
        isPlaying = false
    }
    
    
}

