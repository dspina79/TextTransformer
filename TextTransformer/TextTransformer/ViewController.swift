//
//  ViewController.swift
//  TextTransformer
//
//  Created by Dave Spina on 3/17/21.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {

    @IBOutlet weak var output: NSTextField!
    @IBOutlet weak var type: NSSegmentedCell!
    @IBOutlet weak var input: NSTextField!
    
    func controlTextDidChange(_ obj: Notification) {
        typeChanged(self)
    }
    
    func rot13(_ input: String) -> String {
        return "ROT13: " + input
    }
    
    func strikeThrough(_ input: String) -> String {
        return "Strikethrough: " + input
    }
    
    func similar(_ input: String) -> String {
        return "Similar: " + input
    }
    
    func zalgo(_ input: String) -> String {
        return "Zalgo: " + input
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        typeChanged(self)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func copyToPastboard(_ sender: Any) {
    }
    
    @IBAction func typeChanged(_ sender: Any) {
        switch type.selectedSegment {
        case 0:
            output.stringValue = rot13(input.stringValue)
        case 1:
            output.stringValue = similar(input.stringValue)
        case 2:
            output.stringValue = strikeThrough(input.stringValue)
        default:
            output.stringValue = zalgo(input.stringValue)
        }
    }
}

