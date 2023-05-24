//
//  CardView2.swift
//  Card
//
//  Created by Rabiga on 23.05.2023.
//

import UIKit

@IBDesignable
class Card: UIView {
    var isFlipside: Bool = true
    var mainView: UIView!
    var colorId: Int = 0
    var emojiId: Int = 0
    let emojis: [String] = ["😁", "🥶", "😈", "🤖"]
    let colors = [UIColor.black, UIColor.brown, UIColor.red, UIColor.blue]
    @IBOutlet weak var button: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = true;
        self.button?.backgroundColor = UIColor.green
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    private func configureView(){
        guard let view = self.loadViewFromNib(nibName: "Card") else {return}
        view.frame = self.bounds
        mainView = view
        self.addSubview(view)
        
        
//        Bundle.main.loadNibNamed("CardView", owner: self, options: nil)
//        addSubview(button)
//        card.frame = self.bounds
//        card.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @objc func animate(){
        
    }
    func configureView(id: Int, id2: Int){
        colorId = id
        emojiId = id2
        self.button.backgroundColor = colors[id]
        self.mainView.backgroundColor = self.colors[self.colorId]
        self.button.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 50)
            return outgoing
           }
        self.button.setTitle(emojis[id2], for: .normal)
        self.button.titleLabel?.layer.opacity = 0.0
        
        
    }
    func getEmojiId()->Int{
        return self.emojiId
    }
    func getColorId()->Int{
        return self.colorId
    }

    func generate(_ color: UIColor){
//        self.button.backgroundColor = color
    }
    @IBAction func flip(_ sender: Any){
        
        print("Flip")
        UIButton.animate(withDuration: 1, animations: { [self] in
            self.button.titleLabel?.layer.opacity = 1.0
        })
        
        addToComparison(self)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            UIButton.animate(withDuration: 1, animations: { [self] in
                self.button.titleLabel?.layer.opacity = 0.0
                self.button.setTitle(self.emojis[self.emojiId], for: .normal)
                
                comparisonCard = nil
            })
        })
        self.button.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
              self.button.isUserInteractionEnabled = true
        }
    }
    func disableButton(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
              self.button.isUserInteractionEnabled = true
        }
    }

}
