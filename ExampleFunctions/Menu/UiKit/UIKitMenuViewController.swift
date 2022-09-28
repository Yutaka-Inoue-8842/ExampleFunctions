//
//  UIKitMenuViewController.swift
//  ExampleFunctions
//
//  Created by Yutaka Inoue on 2022/09/28.
//

import UIKit

class UIKitMenuViewController: UIViewController {
    
    
    let items = ["UIActivityViewController(share)","UIView(animation)"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension UIKitMenuViewController: UITableViewDataSource {
    
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

extension UIKitMenuViewController: UITableViewDelegate {
    
}
