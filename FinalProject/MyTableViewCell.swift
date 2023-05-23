//
//  MyTableViewCell.swift
//  column
//
//  Created by Rabiga on 21.05.2023.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject{
    func didTapButton(with title: String)
}


class MyTableViewCell: UITableViewCell{
    weak var delegate: MyTableViewCellDelegate?
    static let identifier = "MyTableViewCell"
    private var title: String = ""
    
    static func nib()->UINib{
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet var button: UIButton!
    
    @IBAction func didTapButton(){
        
        delegate?.didTapButton(with: title)
    }
    
    func configure(with title: String){
        self.title = title
        button.setTitle(title, for: .normal)
    }
    
    override func awakeFromNib(){
        super.awakeFromNib()
        button .setTitleColor(.link, for: .normal)
    }

    
}


