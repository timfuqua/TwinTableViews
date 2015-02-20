//
//  ViewController.swift
//  TwinTableViews
//
//  Created by Tim Fuqua on 2/19/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
  
  var selectableList: [SelectableIngredient] = [SelectableIngredient]()
  var selectedList: [SelectableIngredient] = [SelectableIngredient]()
  
  @IBOutlet weak var mainViewPaddingView: UIView!
  @IBOutlet weak var selectableTableView: UITableView!
  @IBOutlet weak var selectedTableView: UITableView!
  @IBOutlet weak var selectButton: UIButton!
  @IBOutlet weak var deselectButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    for item in allItems {
      addItem(&selectableList, item)
    }
  }
  
  @IBAction func selectButtonPressed(sender: UIButton) {
    moveItemsToSelected()
    selectableTableView.reloadData()
    selectedTableView.reloadData()
  }

  @IBAction func deselectButtonPressed(sender: UIButton) {
    moveItemsToSelectable()
    selectableTableView.reloadData()
    selectedTableView.reloadData()
  }
  
  private func moveItemsToSelected() {
    printItemList(selectableList)
    println()
    printItemList(selectedList)
    
    for item in selectableList {
      if item.selected {
        item.selected = false
        moveItem(&selectableList, &selectedList, item)
      }
    }

    printItemList(selectableList)
    println()
    printItemList(selectedList)
  }

  private func moveItemsToSelectable() {
    printItemList(selectableList)
    println()
    printItemList(selectedList)

    for item in selectedList {
      if item.selected {
        item.selected = false
        moveItem(&selectedList, &selectableList, item)
      }
    }

    printItemList(selectableList)
    println()
    printItemList(selectedList)
  }
  
}

extension ViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    if tableView == selectableTableView {
//      println("selectable count: \(selectable.count)")
      return selectableList.count
    }
    else if tableView == selectedTableView {
//      println("selected count: \(selected.count)")
      return selectedList.count
    }

    println("Shouldn't hit this")
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    if tableView == selectableTableView {
      let cell = tableView.dequeueReusableCellWithIdentifier("selectable", forIndexPath: indexPath) as UITableViewCell
      cell.textLabel!.text = selectableList[indexPath.row].name
      
      if selectableList[indexPath.row].selected {
        cell.accessoryType = .Checkmark
      }
      else {
        cell.accessoryType = .None
      }
      
      return cell
    }
    else if tableView == selectedTableView {
      let cell = tableView.dequeueReusableCellWithIdentifier("selected", forIndexPath: indexPath) as UITableViewCell
      cell.textLabel!.text = selectedList[indexPath.row].name
      
      if selectedList[indexPath.row].selected {
        cell.accessoryType = .Checkmark
      }
      else {
        cell.accessoryType = .None
      }
      
      return cell
    }
    
    println("Shouldn't ever have this cell")
    return tableView.dequeueReusableCellWithIdentifier("selectable", forIndexPath: indexPath) as UITableViewCell
  }
  
}

extension ViewController: UITableViewDelegate {
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
    
    if tableView == selectableTableView {
      let tappedItem = selectableList[indexPath.row] as SelectableIngredient
      tappedItem.selected = !tappedItem.selected
    }
    else if tableView == selectedTableView {
      let tappedItem = selectedList[indexPath.row] as SelectableIngredient
      tappedItem.selected = !tappedItem.selected
    }
    
    tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
  }
  
//  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//    let selectedCell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
//    selectedCell.accessoryType = .None
//  }
  
}
