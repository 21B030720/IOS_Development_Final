//
//  ViewController.swift
//  FinalProject
//
//  Created by Rabiga on 06.05.2023.
//

import UIKit


class ViewController: UIViewController {
    var nightStyle = false
    @IBOutlet weak var firstV: UIStackView!
    @IBOutlet weak var secondV: UIStackView!
    @IBOutlet weak var thirdV: UIStackView!
    @IBOutlet weak var forthV: UIStackView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var switchStyle: UISwitch!
    var pos: Int = 0
    var listOfStacks: [UIStackView] = []
    
    // Initializer
    override func viewDidLoad() {
        
        listOfStacks = [self.firstV, self.secondV, self.thirdV, self.forthV]
    }
    
    @IBAction func switchStyleLogic(_ sender: UISwitch)
    {
        // Standart properties of mainView
        self.mainView.layer.borderColor = UIColor(red: 0.8457908898, green: 0.1717290428, blue: 1, alpha: 1).cgColor
        self.mainView.layer.borderWidth = 5
        self.mainView.bounds = view.frame.insetBy(dx: 10.0, dy: 10.0)
        
        // Logic of Switch
        if (sender.isOn)
        {
            self.mainView.backgroundColor = UIColor(red: 0.8457908898, green: 0.1717290428, blue: 1, alpha: 1)
        }
        else
        {
            self.mainView.backgroundColor = UIColor(#colorLiteral(red: 0.6898682781, green: 0.6429276373, blue: 0.9222203677, alpha: 0.8470588235))
        }
    }
    

}

