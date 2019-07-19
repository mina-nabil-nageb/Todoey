//
//  ViewController.swift
//  Todoey
//
//  Created by mina on 7/13/19.
//  Copyright © 2019 mina. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [Item]()
  // var itemArray = ["first thing","getMilk","go to gym"]
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newItem = Item()
        newItem.title = "first thing"
        itemArray.append(newItem)
        
       let newItem2 = Item()
        newItem2.title = "secoung thing"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "third thing"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "third thing"
        itemArray.append(newItem4)
        
        
        
        itemArray.append(newItem4)
        
        
        
        if let items = defaults.array(forKey: "TodoListArray")as? [Item]{
            itemArray = items
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
       
        // make the check mark
        if itemArray[indexPath.row].done == true{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // set the proberty of the Item class Done for the selected Item
         itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
       
       tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFiled = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
           // append the new item to the array of type Item
            
            let newItem = Item()
            newItem.title = textFiled.text!
          self.itemArray.append(newItem)
            // end of adding the new Item
            
            //self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
           textFiled = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

