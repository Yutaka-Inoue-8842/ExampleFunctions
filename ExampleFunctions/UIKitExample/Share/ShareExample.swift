//
//  ShareExample.swift
//  ExampleFunctions
//
//  Created by Yutaka Inoue on 2022/09/28.
//

import UIKit

class ShareExample: UIViewController {

    @IBOutlet weak var textButton: UIStackView!
    @IBOutlet weak var pictureButton: UIStackView!
    
    var shareItemType = ShareItemType.none
    
    enum ShareItemType {
        case none
        case text(String)
        case picture(AnyObject)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }
    
    func addGesture() {
        let textButtonGesture = UITapGestureRecognizer(target: self, action: #selector(textButtonTapped(_:)))
        let pictureButtonGesture = UITapGestureRecognizer(target: self, action: #selector(pictureButtonTapped(_:)))
        textButton.addGestureRecognizer(textButtonGesture)
        pictureButton.addGestureRecognizer(pictureButtonGesture)
    }
    
    @objc func textButtonTapped(_ gesture: UITapGestureRecognizer) {
        presentShareAlert(title: "テキストを入力してください", body: nil, completion: { text in
            guard let text = text else { return }
            self.shareItemType = .text(text)
            self.presentShareSheet(self.shareItemType)
        })
    }
    
    @objc func pictureButtonTapped(_ gesture: UITapGestureRecognizer) {
        presentImagePicker()
    }
    
    func presentShareSheet(_ type: ShareItemType) {
        var shareSheet:UIActivityViewController!
        switch type {
        case .none:
            break
        case .text(let value):
            shareSheet = UIActivityViewController(activityItems: [value], applicationActivities: nil)
        case .picture(let value):
            shareSheet = UIActivityViewController(activityItems: [value], applicationActivities: nil)
        }
        present(shareSheet, animated: true)
    }
}

extension ShareExample: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as AnyObject
        picker.dismiss(animated: true)
        shareItemType = .picture(image)
        presentShareSheet(shareItemType)

    }
    
}
