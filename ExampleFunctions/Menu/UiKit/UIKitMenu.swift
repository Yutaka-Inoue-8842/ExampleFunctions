//
//  UIKitMenuViewController.swift
//  ExampleFunctions
//
//  Created by Yutaka Inoue on 2022/09/28.
//

import UIKit

class UIKitMenu: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    let sections = ["Examples"]
    
    let items = ["Share","Animation"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension UIKitMenu: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
     
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"UIKitMenuCell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = items[row]
        return cell
    }
    
    
}

extension UIKitMenu: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        let section = indexPath.section
        performSegue(withIdentifier: items[row], sender: nil)
    }
}
