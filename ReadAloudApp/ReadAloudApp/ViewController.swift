//
//  ViewController.swift
//  ReadAloudApp
//
//  Created by Mert Özcan on 13.06.2024.
//

import Cocoa
import AVFoundation

class ViewController: NSViewController {
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    
    var contents:String? {
        get {
            return textView.string
        }
        
        set {
            textView.string = newValue!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func readAloudButtonClicked (sender:NSButton) {
        print("Read Aloud button clicked to say \(textView.string)")
        
        let contents = textView.string
        if !contents.isEmpty {
            let speechUtterance = AVSpeechUtterance(string: contents)
            speechSynthesizer.speak(speechUtterance)

        } else {
            let speechUtterance = AVSpeechUtterance(string: "Nothing to say to you!")
            speechSynthesizer.speak(speechUtterance)
        }
    }
    
    @IBAction func stopButtonClicked (sender:NSButton) {
        print("Stop button clicked")
        speechSynthesizer.stopSpeaking(at: .immediate)
    }


}

