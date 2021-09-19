//
//  item_form_view_controller.swift
//  shopping list
//
//  Created by Brian Liew on 9/19/21.
//

import UIKit

class item_form_view_controller: UIViewController {
    
    // outlets
    @IBOutlet var form_textfield: UITextField!
    @IBOutlet var save_button: UIButton!
    
    // variables
    var item: Item?      // '?' cause initially nil, then assigned values after user input

    // initializers
    init?(coder: NSCoder, item: Item) {
        super.init(coder: coder)
        self.item = item
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        update_view()
        // Do any additional setup after loading the view.
    }
    
    func update_view() {    // updates textfield to display existing item names
        if let an_item = item {
            form_textfield.text = an_item.name
        }
    }

    // actions
    @IBAction func save_button_pressed(_ sender: Any) {
        guard let an_item_name = form_textfield.text
        else { return }
        
        item = Item(name: an_item_name)
        
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
}

