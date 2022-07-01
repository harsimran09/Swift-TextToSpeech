//
//  ViewController.swift
//  TextToSpeech
//
//  Created by ITRS-1519 on 25/02/22.
//

import UIKit
import AVFoundation
//import AVKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textHere: UITextView!
    @IBOutlet weak var segmnetCt: UISegmentedControl!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var SpeechBtn: UIButton!
    
    @IBOutlet weak var pitchValue: UILabel!
    @IBOutlet weak var rateValue: UILabel!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var rateSlider: UISlider!
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        pitchSlider.value = 1
        pitchSlider.maximumValue = 2
        pitchSlider.minimumValue = 0.5
        pitchValue.text = String(format: "%.1f", pitchSlider.value)
        rateValue.text = String(format: "%.1f", rateSlider.value)

        rateSlider.value = AVSpeechUtteranceMaximumSpeechRate
        rateSlider.minimumValue = AVSpeechUtteranceMinimumSpeechRate
        rateSlider.maximumValue = AVSpeechUtteranceMaximumSpeechRate
    }
    
    
    func setUpView(){
        textHere.layer.cornerRadius = 2
        textHere.layer.borderWidth = 2
        textHere.layer.borderColor = UIColor.black.cgColor
        
    }

    @IBAction func speechBtn(_ sender: UIButton) {
        
        if sender == closeBtn{
            textHere.text = ""
            textHere.becomeFirstResponder()
        }
        else{
            resignFirstResponder()
        
        var lang: String = "en-US"
        switch segmnetCt.selectedSegmentIndex {
        case 0:
            lang = "en-US"
             break;
        case 1:
            lang = "fr-FR"
             break;
        case 2:
            lang = "de-DE"
             break;
        case 3:
            lang = "es-ES"
             break;
        case 4:
            lang = "it-IT"
             break;
        default:
            lang = "en-US"
            break;
        }
        
        self.readMe(myText: textHere.text! , myLang: lang)
        }
        
    }
    
    
    var pitch: Float = 1
    var rate: Float = AVSpeechUtteranceMaximumSpeechRate
//
    
    func readMe( myText: String , myLang : String) {
//        let pitch: Float = 1
//        let rate: Float = AVSpeechUtteranceMaximumSpeechRate
        
        let utterance = AVSpeechUtterance(string: myText )
        utterance.voice = AVSpeechSynthesisVoice(language: myLang)
        utterance.rate = rate
        utterance.pitchMultiplier = pitch
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    @IBAction func pitchSliderValueChanged(_ sender: Any) {
        textHere.resignFirstResponder()
        pitchValue.text = String(format: "%.1f", pitchSlider.value)

        pitch = pitchSlider.value
    }

    @IBAction func rateSliderValueChanged(_ sender: Any) {
        textHere.resignFirstResponder()
        rateValue.text = String(format: "%.1f", rateSlider.value)

        rate = rateSlider.value
    }
    
}
