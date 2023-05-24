//
//  Model.swift
//  FinalProject
//
//  Created by Rabiga on 22.05.2023.
//

import Foundation
import UIKit


var comparison: [UIView] = []


func getCards2(name: String)->[Int]{
    return UserDefaults.standard.array(forKey: name) as! [Int]
}



func addCard2(name: String, address: Int){
    
    var newArray = [Int]()
    
    let ns = UserDefaults.standard
    
    let savedArray = ns.array(forKey: name) as! [Int]
    
//    let savedValue: UIView = newCard
    
    newArray = savedArray
    
    newArray.append(address)
    
    ns.set(newArray, forKey: name)
}


func addCard(name: String, colorId: Int, emojiId: Int){
    
    var newArray = [[Int]]()
    
    let ns = UserDefaults.standard
    
    let savedArray = ns.array(forKey: name) as! [[Int]]
    
//    let savedValue: UIView = newCard
    
    newArray = savedArray
    
    newArray.append([colorId, emojiId])
    
    ns.set(newArray, forKey: name)
}

func getCards(name: String)->[[Int]]{
    return UserDefaults.standard.array(forKey: name) as! [[Int]]
}



