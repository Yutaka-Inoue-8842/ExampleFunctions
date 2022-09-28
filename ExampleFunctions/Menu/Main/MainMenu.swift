//
//  ViewController.swift
//  ExampleFunctions
//
//  Created by Yutaka Inoue on 2022/09/28.
//

import UIKit

class MainMenu: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    let sections = ["Framework","Library"]
    
    var items = [
        ["UIKit","UserNotifications","Camera","Bluetooth","GPS"],
        ["RxSwift","Alamofire","RealmSwift","Firebase"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension MainMenu: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
     
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MainMenuCell", for: indexPath)
        let row = indexPath.row
        let section = indexPath.section
        let item = items[section]
        cell.textLabel?.text = item[row]
        return cell
    }
    
}

extension MainMenu: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        let section = indexPath.section
        let item = items[section]
        performSegue(withIdentifier: item[row], sender: nil)
    }
    
}
