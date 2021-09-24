//
//  item_table_view_controllerTableViewController.swift
//  shopping list
//
//  Created by Brian Liew on 9/19/21.
//

import UIKit

class item_table_view_controllerTableViewController: UITableViewController {

    // MARK: - variables
    var all_items: [Item] = []
    
    // MARK: - UITableViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
        
    // MARK: - segues
    @IBSegueAction func add_item(_ coder: NSCoder, sender: Any?) -> item_form_view_controller? {
        return item_form_view_controller(coder: coder)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard
            let form_view_controller = segue.source as? item_form_view_controller,
            let form_item = form_view_controller.item
        else { return }
        
        if let selected_index_path = tableView.indexPathForSelectedRow {
            all_items[selected_index_path.row] = form_item  // if item previously existed
        } else {
            all_items.append(form_item)                     // if item hasn't existed
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return all_items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item_cell", for: indexPath)

        let model = all_items[indexPath.row]
        cell.textLabel?.text = model.name
        
        cell.showsReorderControl = true

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moved_item = all_items.remove(at: sourceIndexPath.row)
        all_items.insert(moved_item, at: destinationIndexPath.row)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            all_items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "edit_item", sender: self)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
