//
//  ViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 09.12.2022.
//

import UIKit

final class UserAccessViewController: UIViewController {
    let model = UserAccess(login: "ivan@mail.ru", password: "123456")
    
    // MARK: - Private Properties
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday Reminder"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.layer.borderWidth = 2.0
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Please insert your login"
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Please insert your password"
        return textField
    }()
    
    private lazy var enterButton: UIButton = {
        var atributes = AttributeContainer()
        atributes.font = .boldSystemFont(ofSize: 18
        )
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedSubtitle = AttributedString("Войти", attributes: atributes)
        buttonConfiguration.baseBackgroundColor = .systemBlue
        return UIButton(configuration: buttonConfiguration, primaryAction: UIAction {_ in
            
        })
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews(
            appNameLabel,
            signInLabel,
            emailLabel,
            loginTextField,
            passwordLabel,
            passwordTextField,
            enterButton
        )
        setupConstraints()
    }
   
    // MARK: - Private Methods
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setupConstraints() {
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //labelAppName.widthAnchor.constraint(equalToConstant: 300),
            appNameLabel.heightAnchor.constraint(equalToConstant: 75),
            appNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75)
        ])
        
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 100),
            signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
            
        ])
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
    }
}


