//
//  ViewController.swift
//  FinalProject
//
//  Created by Rabiga on 06.05.2023.
//


import UIKit
import WebKit


class ViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var firstV: UIStackView!
    @IBOutlet weak var thirdView: UIStackView!
    @IBOutlet weak var fourthView: UIStackView!
    @IBOutlet weak var secondV: UIStackView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var vStack: UIStackView!
    var listOfStacks: [UIStackView] = []
    var spaces: [UIView] = []
    var pos: Int = 0
    var m: Int = 1
    
    // Initializer
    override func viewDidLoad() {
        listOfStacks = [firstV, secondV, thirdView, fourthView]
        
    }
    
//    @IBAction func switchStyleLogic(_ sender: UISwitch)
//    {
//        // Standart properties of mainView
//        self.mainView.layer.borderColor = UIColor(red: 0.8457908898, green: 0.1717290428, blue: 1, alpha: 1).cgColor
//        self.mainView.layer.borderWidth = 5
//        self.mainView.bounds = view.frame.insetBy(dx: 10.0, dy: 10.0)
//
//        // Logic of Switch
//        if (sender.isOn)
//        {
//            self.mainView.backgroundColor = UIColor(red: 0.8457908898, green: 0.1717290428, blue: 1, alpha: 1)
//        }
//        else
//        {
//            self.mainView.backgroundColor = UIColor(#colorLiteral(red: 0.6898682781, green: 0.6429276373, blue: 0.9222203677, alpha: 0.8470588235))
//        }
//    }
    

//    @IBAction func addLogic(_ sender: Any) {
//        let button = UIButton()
//        button.setTitle("Button Ars", for: .normal)
//        button.backgroundColor = .red
//        firstV.addArrangedSubview(button)
//        pos += 1
//        pos %= 4

//        print("Hellow")
//        print(pos)
//    }
    
    @IBAction func addView(_ sender: Any) {
        let colors = [UIColor.black, UIColor.brown, UIColor.red, UIColor.blue]

        
        let viewDemo = UIView()
        viewDemo.frame = CGRect(x: 10, y: 10 + 50 * (m - 1), width: 50, height: 100)
        viewDemo.backgroundColor = colors[Int.random(in: 0..<4)]
        viewDemo.layer.cornerRadius = 5;
        viewDemo.layer.masksToBounds = true;
        viewDemo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        listOfStacks[pos].addArrangedSubview(viewDemo)
        
        
        if(spaces.count != 0){
            spaces[0].removeFromSuperview()
            spaces.remove(at: 0)
        }
        
        if(pos == 0){
            for i in 1...3{
                let space = UIView()
                space.frame = CGRect(x: 10, y: 10 + 50 * (m - 1), width: 50, height: 100)
                space.backgroundColor = UIColor.white
                space.heightAnchor.constraint(equalToConstant: 100).isActive = true
                
                listOfStacks[i].addArrangedSubview(space)
                spaces.append(space)
            }
        }
        
        
        
//        vStack.addArrangedSubview(viewDemo)
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapEventDetected(gesture:)))
//        viewDemo.addGestureRecognizer(gesture)
        
//        listOfStacks[pos].addArrangedSubview(label)
        pos += 1
        pos %= 4
    }
}

