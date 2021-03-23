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
    
    let zalgoChars = ZalgoCharacters()
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        typeChanged(self)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func controlTextDidChange(_ obj: Notification) {
        typeChanged(self)
    }
    
    func rot13(_ input: String) -> String {
        return ROT13.string(input)
    }
    
    func strikeThrough(_ input: String) -> String {
        var output = ""
        
        for letter in input {
            output.append(letter)
            output.append("\u{0335}")
        }
        return output
    }
    
    func similar(_ input: String) -> String {
        var output = input
        output = output.replacingOccurrences(of: "a", with: "а")
        output = output.replacingOccurrences(of: "e", with: "е")
        output = output.replacingOccurrences(of: "i", with: "і")
        output = output.replacingOccurrences(of: "o", with: "о")
        output = output.replacingOccurrences(of: "p", with: "р")
        return output
    }
    
    func zalgo(_ input: String) -> String {
        var output = ""
        
        for letter in input {
            output.append(letter)
            for _ in 1...Int.random(in: 1...8) {
                output.append(zalgoChars.above.randomElement()!)
            }
            
            for _ in 1...Int.random(in: 1...4) {
                output.append(zalgoChars.inline.randomElement()!)
            }
            
            for _ in 1...Int.random(in: 1...8) {
                output.append(zalgoChars.above.randomElement()!)
            }
            
            for _ in 1...Int.random(in: 1...8) {
                output.append(zalgoChars.below.randomElement()!)
            }
        }
        
        return output
    }

    @IBAction func copyToPastboard(_ sender: Any) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(output.stringValue, forType: .string)
    }

}

