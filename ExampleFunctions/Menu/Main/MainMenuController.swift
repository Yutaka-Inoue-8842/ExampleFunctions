//
//  ViewController.swift
//  ExampleFunctions
//
//  Created by Yutaka Inoue on 2022/09/28.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    let sections = ["Framework","Library"]
    
    let items = [
        0: ["UIKit","UserNotifications","Camera","Bluetooth","GPS"],
        1: ["RxSwift","Alamofire","RealmSwift","Firebase"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
     
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = items[section] else { return 0 }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MainMenuCell", for: indexPath)
        let row = indexPath.row
        let section = indexPath.section
        guard let items = items[section] else { return cell }
        cell.textLabel?.text = items[row]
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
}
