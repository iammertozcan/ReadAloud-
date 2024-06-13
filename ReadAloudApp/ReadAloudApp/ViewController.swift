//
//  ViewController.swift
//  ReadAloudApp
//
//  Created by Mert Özcan on 13.06.2024.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
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
    }
    
    @IBAction func stopButtonClicked (sender:NSButton) {
        print("Stop button clicked")
    }


}

