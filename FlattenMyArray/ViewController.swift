//
//  ViewController.swift
//  FlattenMyArray
//
//  Created by Asil Erguner on 2018-01-12.
//  Copyright © 2018 Asil Erguner. All rights reserved.
//  App creates random arrays then flattens and sums the numbers inside. 

import UIKit

class ViewController: UIViewController {
    
    //nested array might be defined by the user by a text field as well.
    let nested: [Any] = [0,[1,2],"login",["recover",["password","username"]]]

    @IBOutlet weak var nestedArrayLabel: UILabel!
    @IBOutlet weak var flattenButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true
        nestedArrayLabel.text = String(describing: nested)
    }

    @IBAction func clearButtonPressed(_ sender: Any) {
        resultLabel.text = ""
        flattenButton.isEnabled = true
        flattenButton.backgroundColor = #colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1)
        clearButton.isEnabled = false
        clearButton.backgroundColor = #colorLiteral(red: 1, green: 0.4367101192, blue: 0.5435128808, alpha: 1)
    }
    
    @IBAction func flattenButtonPressed(_ sender: Any) {
        
            let flattenedArray = nested.flattenedArray
            resultLabel.text = String(describing: flattenedArray)
            flattenButton.isEnabled = false
            flattenButton.backgroundColor = #colorLiteral(red: 1, green: 0.4367101192, blue: 0.5435128808, alpha: 1)
            clearButton.isEnabled = true
            clearButton.backgroundColor = #colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1)
            resultLabel.isHidden = false
    }
}

extension Array {
    var flattenedArray: [Any] {
        return flatMap { ($0 as? [Any])?.flattenedArray ?? [$0] }
    }
    func flatMapped<T>(with type: T.Type) -> [T] {
        return flatMap { ($0 as? [Any])?.flatMapped(with: type) ?? ($0 as? T).map { [$0] } ?? [] }
    }
}





