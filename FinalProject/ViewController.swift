//
//  ViewController.swift
//  column
//
//  Created by Rabiga on 20.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    // Data and main objects
    let data = ["First", "Second"]
    @IBOutlet weak var table: UITableView!
    var pointer: String = ""
//    let userDefaults = UserDefaults()
    
    // Initializer
    override func viewDidLoad() {
        title = "List"
        super.viewDidLoad()
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.dataSource = self
    }
    
    // logic for tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }
    
}


extension ViewController: MyTableViewCellDelegate{
    func didTapButton(with title: String) {
        pointer = title
        print(pointer, "All")
        let rootController = GameController()
        rootController.load(loading: getCards(name: pointer))
        rootController.title = pointer
//        let navController = UINavigationController(rootViewController: rootController)
//        present(navController, animated: true)
        navigationController?.pushViewController(rootController, animated: true)

    }
}

