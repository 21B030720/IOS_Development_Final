//
//  Model.swift
//  FinalProject
//
//  Created by Rabiga on 22.05.2023.
//

import Foundation
import UIKit
//var cards: [Int: [UIView]]{
//    set{
//        UserDefaults.standard.set(newValue, forKey: "cards")
//        UserDefaults.standard.synchronize()
//    }
//    get {
//        if let dict = UserDefaults.standard.dictionary(forKey: "cards") as? [Int: [UIView]] {
//            return dict
//        }
//        else {
//            return [:]
//        }
//    }
//}


extension UserDefaults {
  func colorForKey(key: String) -> UIColor? {
    var colorReturnded: UIColor?
    if let colorData = data(forKey: key) {
      do {
        if let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor {
          colorReturnded = color
        }
      } catch {
        print("Error UserDefaults")
      }
    }
    return colorReturnded
  }
  
  func setColor(color: UIColor?, forKey key: String) {
    var colorData: NSData?
    if let color = color {
      do {
        let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
        colorData = data
      } catch {
        print("Error UserDefaults")
      }
    }
    set(colorData, forKey: key)
  }
}

func getCards(name: String)->[Int]{
    return UserDefaults.standard.array(forKey: name) as! [Int]
}



func addCard(name: String, address: Int){
    
    var newArray = [Int]()
    
    let ns = UserDefaults.standard
    
    let savedArray = ns.array(forKey: name) as! [Int]
    
//    let savedValue: UIView = newCard
    
    newArray = savedArray
    
    newArray.append(address)
    
    ns.set(newArray, forKey: name)
}




