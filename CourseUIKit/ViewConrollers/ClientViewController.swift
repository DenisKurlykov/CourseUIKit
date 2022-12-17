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
        let alert = UIAlertController(title: "Выставить счет", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { action in
            let next = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
            self.navigationController?.pushViewController(next, animated: true)

        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
}
