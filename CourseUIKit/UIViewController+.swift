//
//  UIViewController+.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 13.12.2022.
//

import UIKit

extension UIViewController {
    func alertWithToTextFields(title: String, message: String, textFieldPlaceholderOne: String, textFieldPlaceholderTwo: String, completion: @escaping (String?, String?)->()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { _ -> Void in
            let urlTextFieldOne = alertController.textFields![0] as UITextField
            let urlTextFieldTwo = alertController.textFields![1] as UITextField
            completion(urlTextFieldOne.text, urlTextFieldTwo.text)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = textFieldPlaceholderOne
            completion(nil, nil)
        }
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = textFieldPlaceholderTwo
            completion(nil, nil)
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
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
}
