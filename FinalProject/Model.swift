//
//  Model.swift
//  FinalProject
//
//  Created by Rabiga on 22.05.2023.
//

import Foundation
import UIKit


var comparisonCard: Card? = nil
var allCards: [Card] = []
func blockAllCards(){
}
func addToComparison(_ second: Card){
    if(comparisonCard == nil){
        comparisonCard = (second)
    }
    else{
        if(comparisonCard!.getEmojiId() == second.getEmojiId()){
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                UIButton.animate(withDuration: 1, animations: { [] in
                    comparisonCard?.removeFromSuperview()
                    second.removeFromSuperview()
                    comparisonCard = nil
                })
            })
            
        }
        else{
            comparisonCard = second
        }
    }
}


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



