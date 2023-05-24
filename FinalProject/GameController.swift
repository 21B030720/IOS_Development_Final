//
//  GameController.swift
//  FinalProject
//
//  Created by Rabiga on 23.05.2023.
//

import UIKit

class GameController: UIViewController {
    @IBOutlet var firstV: UIStackView!
    @IBOutlet var secondV: UIStackView!
    @IBOutlet var thirdV: UIStackView!
    @IBOutlet var forthV: UIStackView!
    var listOfStacks: [UIStackView] = []
    let emojis: [String] = ["😁", "🥶", "😈", "🤖"]
    let colors = [UIColor.black, UIColor.brown, UIColor.red, UIColor.blue]
    var spaces: [UIView] = []
    var loadedData: [[Int]] = []
    var pos: Int = 0
    var m: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        allCards = []
        listOfStacks = [firstV, secondV, thirdV, forthV]
        load2()
    }
    
    
    func load(loading: [[Int]]){
        loadedData = loading
    }
    func load2(){
        print(loadedData.count)
        for address in loadedData{
            let viewDemo = Card(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
            viewDemo.configureView(id: address[0], id2: address[1])
            viewDemo.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            allCards.append(viewDemo)
            listOfStacks[pos].addArrangedSubview(viewDemo)
            pos += 1
            pos %= 4
        }
        while(pos != 0){
            let space = UIView()
            space.backgroundColor = UIColor.white
            space.layer.cornerRadius = 5;
            space.layer.masksToBounds = true;
            space.heightAnchor.constraint(equalToConstant: 100).isActive = true

            listOfStacks[pos].addArrangedSubview(space)
            spaces.append(space)
            pos += 1
            pos %= 4
        }
        pos = loadedData.count % 4

    }
    
    @IBAction func addView(_ sender: Any){
        // Create Object of View
        let address1 = Int.random(in: 0..<4)
        let address2 = Int.random(in: 0..<4)
        let viewDemo = Card(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        viewDemo.configureView(id: address1, id2: address2)
        viewDemo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        allCards.append(viewDemo)
        listOfStacks[pos].addArrangedSubview(viewDemo)
        addCard(name: title!, colorId: address1, emojiId: address2)
        
        
        
        // Logic for Spaces in Stacks
        if(spaces.count != 0){
            spaces[0].removeFromSuperview()
            spaces.remove(at: 0)
        }
        
        if(pos == 0){
            for i in 1...3{
                let space = UIView()
//                space.frame = CGRect(x: 10, y: 10 + 50 * (m - 1), width: 50, height: 100)
                space.backgroundColor = UIColor.white
                space.heightAnchor.constraint(equalToConstant: 100).isActive = true
                
                listOfStacks[i].addArrangedSubview(space)
                spaces.append(space)
            }
        }
        
        pos += 1
        pos %= 4
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
