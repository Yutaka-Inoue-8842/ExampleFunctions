//
//  ShareExample.swift
//  ExampleFunctions
//
//  Created by Yutaka Inoue on 2022/09/28.
//

import UIKit

class ShareExample: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shareSheet = UIActivityViewController(activityItems: ["Example"], applicationActivities: nil)
        present(shareSheet, animated: true)

    }

}
