//
//  ViewController.swift
//  column
//
//  Created by Rabiga on 20.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    // Data and main objects
    
    var data = ["First", "Second"]
    @IBOutlet weak var table: UITableView!
    var pointer: String = ""
    
    // Initializer
    override func viewDidLoad() {
        UserDefaults.standard.set([], forKey: "First")
        UserDefaults.standard.set([], forKey: "Second")
//        UserDefaults.standard.set([], forKey: "titles")
        data = UserDefaults.standard.array(forKey: "titles") as! [String]
        title = "List"
        super.viewDidLoad()
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.dataSource = self
    }
    
    // logic for tableView
    //
    //
    //
    //
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            table.beginUpdates()
            data.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: .fade)
            table.endUpdates()
        }
    }
    @IBAction func editMode(_ sender: Any){
        table.setEditing(!table.isEditing, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.table.reloadData()

        }
    }
    @IBAction func addCell(_ sender: Any){
        var name = ""
        let emojis = ["💩", "🙉", "👾", "✋🏾", "🦾", "🧠", "👄", "👸", "🦹🏿‍♂️"]
        let max: Int = Int.random(in: 0..<20)
        for _ in 0..<max{
            name.append(emojis[Int.random(in: 0..<9)])
        }
        data.append(name)
        UserDefaults.standard.set([], forKey: name)
        var s = UserDefaults.standard.array(forKey: "titles") as! [String]
        s.append(name)
        UserDefaults.standard.set(s, forKey: "titles")

        table.beginUpdates()
        table.insertRows(at: [
               (NSIndexPath(row: data.count-1, section: 0) as IndexPath)], with: .automatic)
        table.endUpdates()
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

