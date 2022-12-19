//
//  ViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 09.12.2022.
//

import UIKit
// 1. Создать экран регистрации где нужно ввести логин и пароль 2 поля и кнопка вход которая ведёт на второй экран

final class ViewController: UIViewController {
    
    // MARK: - IBAOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Public Properties
    let model = Access()
    
    // MARK: - Life Cycles Method
    override func viewWillAppear(_ animated: Bool) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginTF()
        setupPasswordTF()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBAction
    @IBAction func goToClientVC(_ sender: UIButton) {
        if loginTextField.text == model.login && passwordTextField.text == model.password {
            let next = self.storyboard?.instantiateViewController(withIdentifier: "ClientViewController") as! ClientViewController
            self.navigationController?.pushViewController(next, animated: true)
        } else {
            alert(title: "Не верные данные", message: "")
        }
    }
    
    // MARK: - Private Methods
    private func setupLoginTF() {
        loginTextField.placeholder = "Ведите логин"
        loginTextField.text = ""
    }
    
    private func setupPasswordTF() {
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.keyboardType = UIKeyboardType.decimalPad
        passwordTextField.text = ""
        passwordTextField.isSecureTextEntry = true
    }
}

// MARK: - Alert
extension ViewController {
    func alert(title: String, message: String) {
        alert(title: title, message: message) { [weak passwordTextField] in
            guard let passwordTF = passwordTextField else { return }
            passwordTF.text = ""
        }
    }
}


