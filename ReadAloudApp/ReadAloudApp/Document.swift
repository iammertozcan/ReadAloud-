//
//  Document.swift
//  ReadAloudApp
//
//  Created by Mert Özcan on 13.06.2024.
//

import Cocoa

class Document: NSDocument {
    
    var contents: String = ""
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }
    
    override class var autosavesInPlace: Bool {
        return true
    }
    
    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
        
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        self.addWindowController(windowController)
    }
    
    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        let contents = viewController.contents ?? ""
        if let data = contents.data(using: .utf8) {
            return data
        } else {
            let userInfo = [NSLocalizedRecoveryOptionsErrorKey: "File connot be encoded in UTF8"]
            throw NSError(domain: "", code: 0, userInfo: userInfo)
        }
    }
    
    override func read(from data: Data, ofType typeName: String) throws {
        if let contents = String(data: data, encoding: .utf8) {
            self.contents = contents
        } else {
            let userInfo = [NSLocalizedRecoverySuggestionErrorKey: "File is not valid UTF8"]
            throw NSError(domain: "", code: 0, userInfo: userInfo)
        }
    }
}
