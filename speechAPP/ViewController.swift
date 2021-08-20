//
//  ViewController.swift
//  speechAPP
//
//  Created by 王昱淇 on 2021/8/19.
//

import UIKit
import AVFoundation
import CloudKit

class ViewController: UIViewController {
    
    @IBOutlet weak var speechTextField: UITextField!
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    // 動物按鈕
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var redFoxButton: UIButton!
    @IBOutlet weak var gazelleButton: UIButton!
    @IBOutlet weak var cheetahButton: UIButton!
    @IBOutlet weak var sheepButton: UIButton!
    @IBOutlet weak var fennecFoxButton: UIButton!
    @IBOutlet weak var arcticShrewButton: UIButton!
    @IBOutlet weak var capeBuffaloButton: UIButton!
    @IBOutlet weak var threeToedSlothButton: UIButton!
    
    // 語言分段控制
    @IBOutlet weak var languageSegmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
           
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
                  self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
       }
       @objc func dismissKeyBoard() {
               self.view.endEditing(true)
       }
    
    // 表示數值的 label 小數點後一位
    @IBAction func changeRateSlider(_ sender: Any) {
        speedLabel.text = String(format: "%.1f", rateSlider.value)
    }
    @IBAction func changePitchSlider(_ sender: Any) {
        pitchLabel.text = String(format: "%.1f", pitchSlider.value)
    }
    @IBAction func changeVolumeSlider(_ sender: Any) {
        volumeLabel.text = String(format: "%.1f", volumeSlider.value)
    }
    
    
    // 合成器
    let synthesizer = AVSpeechSynthesizer()
    var isPlaying: Bool = true
    var pauseTemporary: Bool = true
    
    // 播放鍵
    @IBAction func speech(_ sender: Any) {
        
        // 正在講話的時候，按播放無用
        if synthesizer.continueSpeaking() {
            return
            
        }
        
        // 按暫停後，按播放繼續播放
       if pauseTemporary && !isPlaying {
            synthesizer.continueSpeaking()
            isPlaying = true
            pauseTemporary = false
            return
        }
        
        // 讀取告白的話
        let speechUtterance = AVSpeechUtterance(string: speechTextField.text!)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        
        // 速度、音調、音量
        speechUtterance.rate = rateSlider.value
        speechUtterance.pitchMultiplier = pitchSlider.value
        speechUtterance.volume = volumeSlider.value
        synthesizer.speak(speechUtterance)
        
        isPlaying = true
        pauseTemporary = false
        
        }
    
  
    @IBAction func pauseButton(_ sender: Any) {
        synthesizer.pauseSpeaking(at:AVSpeechBoundary.immediate)
        pauseTemporary = true
        isPlaying = false
        
    }
  
    
    @IBAction func speakAnimalName(_ sender: UIButton) {
        
        var animalName = AVSpeechUtterance()
        
        if languageSegmentControl.selectedSegmentIndex == 0 {
            if sender == rabbitButton {
                animalName = AVSpeechUtterance(string: "兔子")
            }
            if  sender == redFoxButton {
                animalName = AVSpeechUtterance(string: "狐狸")
            }
            if sender == gazelleButton {
                animalName = AVSpeechUtterance(string: "非洲羚羊")
            }
            if sender == cheetahButton {
                animalName = AVSpeechUtterance(string: "獵豹")
            }
            if sender == sheepButton {
                animalName = AVSpeechUtterance(string: "綿羊")
            }
            if sender == fennecFoxButton {
                animalName = AVSpeechUtterance(string: "廓耳狐")
            }
            if sender == arcticShrewButton {
                animalName = AVSpeechUtterance(string: "鼩鼱")
            }
            if sender == capeBuffaloButton {
                animalName = AVSpeechUtterance(string: "水牛")
            }
            if sender == threeToedSlothButton {
                animalName = AVSpeechUtterance(string: "侏三趾樹懶")
            }
            
            // 語言：中文
            animalName.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            
        } else if languageSegmentControl.selectedSegmentIndex == 1 {
            
            if sender == rabbitButton {
                animalName = AVSpeechUtterance(string: "rabbit")
            }
            if  sender == redFoxButton {
                animalName = AVSpeechUtterance(string: "red Fox")
            }
            if sender == gazelleButton {
                animalName = AVSpeechUtterance(string: "gazelle")
            }
            if sender == cheetahButton {
                animalName = AVSpeechUtterance(string: "cheetah")
            }
            if sender == sheepButton {
                animalName = AVSpeechUtterance(string: "sheep")
            }
            if sender == fennecFoxButton {
                animalName = AVSpeechUtterance(string: "fennec Fox")
            }
            if sender == arcticShrewButton {
                animalName = AVSpeechUtterance(string: "arctic Shrew")
            }
            if sender == capeBuffaloButton {
                animalName = AVSpeechUtterance(string: "cape Buffalo")
            }
            if sender == threeToedSlothButton {
                animalName = AVSpeechUtterance(string: "three Toed Sloth")
            }
            
            // 語言：中文
            animalName.voice = AVSpeechSynthesisVoice(language: "en-US")
        }
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(animalName)
    }
    
    
}

