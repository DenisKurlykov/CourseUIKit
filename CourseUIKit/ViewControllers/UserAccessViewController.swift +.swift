//
//  AlertController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 26.12.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String, message: String, completion: @escaping() -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ -> Void in
            completion()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    func alertWithCancelButton(title: String, message: String, textFieldPlaceholder: String, completion: @escaping (String?)->()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
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

