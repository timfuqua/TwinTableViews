//
//  SelectableIngredient.swift
//  TwinTableViews
//
//  Created by Tim Fuqua on 2/19/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit
import Foundation
//import Swift

func ==(lhs: SelectableIngredient, rhs: SelectableIngredient) -> Bool {
  return lhs.name == rhs.name &&
    lhs.form == rhs.form &&
    lhs.type == rhs.type
}

class SelectableIngredient: Equatable {
  
  var name: String
  enum FormType { case Liquid, Solid, Gas }
  var form: FormType
  enum FoodType { case Dairy, Grain, Vegetable, Meat, Other }
  var type: FoodType
  
  var selected: Bool = false
  
  init(name: String, form: FormType, type: FoodType) {
    self.name = name
    self.form = form
    self.type = type
  }
  
}

let allItems: [SelectableIngredient] = [
  SelectableIngredient(name: "Egg", form: .Solid, type: .Meat),
  SelectableIngredient(name: "Milk", form: .Liquid, type: .Dairy),
  SelectableIngredient(name: "Cheese", form: .Solid, type: .Dairy),
  SelectableIngredient(name: "Bread", form: .Solid, type: .Grain),
  SelectableIngredient(name: "Flour", form: .Solid, type: .Grain),
  SelectableIngredient(name: "Oxygen", form: .Gas, type: .Other),
  SelectableIngredient(name: "Garlic", form: .Solid, type: .Vegetable),
  SelectableIngredient(name: "Onion", form: .Solid, type: .Vegetable),
  SelectableIngredient(name: "Green Pepper", form: .Solid, type: .Vegetable),
  SelectableIngredient(name: "Salt", form: .Solid, type: .Other),
  SelectableIngredient(name: "Pepper", form: .Solid, type: .Other),
  SelectableIngredient(name: "Vinegar", form: .Liquid, type: .Other),
  SelectableIngredient(name: "Water", form: .Liquid, type: .Other),
  SelectableIngredient(name: "Beer", form: .Liquid, type: .Other),
  SelectableIngredient(name: "Helium", form: .Gas, type: .Other),
  SelectableIngredient(name: "Butter", form: .Solid, type: .Dairy),
  SelectableIngredient(name: "Salmon", form: .Solid, type: .Meat),
  SelectableIngredient(name: "Steak", form: .Solid, type: .Meat)
]

func itemExists(inList: [SelectableIngredient], item: SelectableIngredient) -> Bool {
  return contains(inList, item)
}

func removeItem(inout fromList: [SelectableIngredient], item: SelectableIngredient) {
  let index: Int? = find(fromList, item)
  if index != nil {
    fromList.removeAtIndex(index!)
  }
}

func addItem(inout toList: [SelectableIngredient], item: SelectableIngredient) {
  toList.append(item)
}

func moveItem(inout fromList: [SelectableIngredient], inout toList: [SelectableIngredient], item: SelectableIngredient) {
  if itemExists(fromList, item) {
    removeItem(&fromList, item)
    addItem(&toList, item)
  }
}

func printItemList(list: [SelectableIngredient]) {
  for item in list {
    print("\(item.selected) \(item.name) ")

    switch item.form {
    case .Solid:
      print("Solid")
    case .Liquid:
      print("Liquid")
    case .Gas:
      print("Gas")
    }
    
    print(" ")

    switch item.type {
    case .Dairy:
      println("Dairy")
    case .Grain:
      println("Grain")
    case .Vegetable:
      println("Vegetable")
    case .Meat:
      println("Meat")
    case .Other:
      println("Other")
    }
  }
}

