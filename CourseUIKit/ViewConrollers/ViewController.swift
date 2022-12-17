//
//  ViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 09.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let access = Access()

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }


    @IBAction func goToClientVC(_ sender: UIButton) {
        if loginTextField.text == access.login && passwordTextField.text == access.password {
            let next = self.storyboard?.instantiateViewController(withIdentifier: "ClientViewController") as! ClientViewController
            self.navigationController?.pushViewController(next, animated: true)
        } else {
            alert()
        }
    }
}

extension ViewController {

    func alert() {
        alert(title: "Не верные данные", message: "") { [weak passwordTextField, weak loginTextField] in
            guard let loginTF = loginTextField else { return }
            guard let passwordTF = passwordTextField else { return }
            loginTF.text = ""
            passwordTF.text = ""
        }
    }
}
