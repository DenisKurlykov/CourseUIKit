//
//  AlertController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 17.12.2022.
//

import UIKit

extension UIViewController {
    func alertWithoutCancelButton(title: String, message: String, textFieldPlaceholder: String, completion: @escaping (String?)->()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { _ -> Void in
            let urlTextField = alertController.textFields![0] as UITextField
            completion(urlTextField.text)
        }
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = textFieldPlaceholder
        }
        alertController.addAction(saveAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alert(title: String, message: String, completion: @escaping ()->()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        { _ -> Void in completion() }
        
        alertController.addAction(saveAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertWithCancel(title: String, message: String, completion: @escaping ()->()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        { _ -> Void in completion() }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

