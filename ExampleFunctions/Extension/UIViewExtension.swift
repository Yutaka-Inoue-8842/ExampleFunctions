//
//  UIViewExtension.swift
//  ExampleFunctions
//
//  Created by Yutaka Inoue on 2022/10/10.
//

import UIKit

extension UIViewController {
    
    func presentShareAlert(title: String?, body: String?, completion: @escaping (String?) -> Void) {
        let alertView = UIAlertController(title: title, message: body, preferredStyle: .alert)
        alertView.addTextField()
        let shareAction = UIAlertAction(title: "共有", style: .default) { action in
            completion(alertView.textFields?.first?.text)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { action in
          completion(alertView.textFields?.first?.text)
        }
        alertView.addAction(shareAction)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true)
    }
}
