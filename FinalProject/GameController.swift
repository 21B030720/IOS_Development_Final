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
    let colors = [UIColor.black, UIColor.brown, UIColor.red, UIColor.blue]
    var spaces: [UIView] = []
    var loadedData: [Int] = []
    var pos: Int = 0
    var m: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfStacks = [firstV, secondV, thirdV, forthV]
        load2()
    }
    
    
    func load(loading: [Int]){
        loadedData = loading
    }
    func load2(){
        print(loadedData.count)
        for address in loadedData{
            let viewDemo = UIView()
//            viewDemo.frame = CGRect(x: 1, y: 1, width: 50, height: 200)
            viewDemo.backgroundColor = colors[address]
            viewDemo.layer.cornerRadius = 5;
            viewDemo.layer.masksToBounds = true;
            viewDemo.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
        let viewDemo = UIView()
        let address = Int.random(in: 0..<4)
//        viewDemo.frame = CGRect(x: 1, y: 1, width: 50, height: 200)
        viewDemo.backgroundColor = colors[address]
        viewDemo.layer.cornerRadius = 5;
        viewDemo.layer.masksToBounds = true;
        viewDemo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        addCard(name: title!, address: address)
        
        listOfStacks[pos].addArrangedSubview(viewDemo)
        
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
