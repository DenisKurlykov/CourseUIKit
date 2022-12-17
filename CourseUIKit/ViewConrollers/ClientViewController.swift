//
//  ClientViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 15.12.2022.
//

import UIKit

class ClientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func paymentButtonPressed(_ sender: Any) {
        alert()
    }
    
}

extension ClientViewController {
    func alert() {
        alertWithCancel(title: "Выставить счет", message: "") {
            let next = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
            self.navigationController?.pushViewController(next, animated: true)
        }
    }
}
