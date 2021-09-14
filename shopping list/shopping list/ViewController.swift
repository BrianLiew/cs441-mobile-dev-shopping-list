//
//  ViewController.swift
//  shopping list
//
//  Created by Brian Liew on 9/10/21.
//

import UIKit

class ViewController: UIViewController {

    // outlets
    @IBOutlet var main_textfield: UITextField!
    @IBOutlet var main_tableview: UITableView!
    
    // variables & data structures
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let input = textField.text {
            items.append(input)
        }
        return true
    }
}
