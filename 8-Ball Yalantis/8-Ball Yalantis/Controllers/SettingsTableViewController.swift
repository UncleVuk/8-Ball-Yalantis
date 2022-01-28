//
//  SettingsTableViewController.swift
//  8-Ball Yalantis
//
//  Created by Yevhenii Vuksta on 28.01.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet var settingsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    // Method to return number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Method to return number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Get answers array count
        return AnswerList.shared.answers.count
    }
    
    
    // Method to create every cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create cell
        let cell = settingsTable.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        
        // Populate cell with elements of local answers array
        cell.textLabel?.text = AnswerList.shared.answers[indexPath.row]
        
        // Return created cell
        return cell
    }
    
    // Support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove item from array
            AnswerList.shared.removeItem(index: indexPath.row)
            // remove row from table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Add button - create new record
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        //Request user to enter item to add
        let addAlertView = UIAlertController(title: "Enter new item", message: nil, preferredStyle: .alert)
        
        // Add editable text field to alert view
        addAlertView.addTextField { (textFieldInput) in
            textFieldInput.placeholder = "New item"
        }
        
        // Save new item
        let saveAlertAction = UIAlertAction(title: "Add", style: .default) { (alert) in
            // Make sure there is something in input field
            if let newItem = addAlertView.textFields![0].text {
                
                // Create new item
                AnswerList.shared.addItem(item: newItem)
                
                // Refresh table to show changes
                self.tableView.reloadData()
            }
        }
        
        // Close alert without save
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        // Add buttons to alert view
        addAlertView.addAction(saveAlertAction)
        addAlertView.addAction(cancelAlertAction)
        
        // Display alert view
        present(addAlertView, animated: true, completion: nil)
        
        
        
    }
    
    // Back button - save changes and close settings
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        // Close settings view
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetToDefaultsPressed(_ sender: UIButton) {
        // Reset answers to default
        AnswerList.shared.setDefaultList()
        
        // Refresh table to display changes
        self.tableView.reloadData()
    }
    
    
}
