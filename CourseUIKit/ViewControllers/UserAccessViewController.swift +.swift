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
}
