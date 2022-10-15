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
    
    func presentCameraOrPhotoLibraryAlert(completion: @escaping (UIImagePickerController.SourceType?) -> Void) {
        let alertView = UIAlertController(title: "画像を選択して下さい", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "撮影する", style: .default) { action in
            completion(.camera)
        }
        let photoLibraryAction = UIAlertAction(title: "カメラロールから選択", style: .default) { action in
            completion(.photoLibrary)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { action in
            completion(nil)
        }
        alertView.addAction(cameraAction)
        alertView.addAction(photoLibraryAction)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true)
    }
}
