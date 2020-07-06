//
//  ViewController.swift
//  Checklist
//
//  Created by Brian on 6/18/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

  var row0Item: ChecklistItem
  
  required init?(coder aDecoder: NSCoder) {
    row0Item = ChecklistItem()
    row0Item.text = "Radhika"
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    
    if let label = cell.viewWithTag(1000) as? UILabel {
      if indexPath.row  == 0 {
        label.text = row0Item.text
        label.textColor = .orange
      } else {
        label.text = ""
      }
    }
    
    
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      
      if indexPath.row == 0 {
        if row0Item.checked {
          cell.accessoryType = .none
        } else {
          cell.accessoryType = .checkmark
        }
        row0Item.checked = !row0Item.checked
      }
      if cell.accessoryType == .none {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  }

