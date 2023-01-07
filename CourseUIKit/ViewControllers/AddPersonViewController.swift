//
//  AddPersonViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 28.12.2022.
//

import UIKit

final class AddPersonViewController: UIViewController {
    
    // MARK: - Public Properties
    var model = Customer()
    var completion: ((Customer) -> ())?
    
    // MARK: - Private Properties
    private lazy var personPhoto: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "person")
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        return image
    }()
    
    private lazy var changePhotoButton: UIButton = {
        var atributes = AttributeContainer()
        atributes.font = .boldSystemFont(ofSize: 18)
        atributes.foregroundColor = .systemBlue
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.attributedTitle = AttributedString(
            "Изменить фото",
            attributes: atributes)
        
        return UIButton(configuration: buttonConfiguration, primaryAction: UIAction { _ in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true)
        })
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите имя"
        textField.textAlignment = .left
        textField.delegate = self
        return textField
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemBlue
        return label
    }()
    
    private let dateTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Добавить дату"
        textField.textAlignment = .left
        return textField
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemBlue
        return label
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Добавить возраст"
        textField.textAlignment = .left
        return textField
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Пол"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemBlue
        return label
    }()
    
    private let genderTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Добавить пол"
        textField.textAlignment = .left
        return textField
    }()
    
    private let instagramLabel: UILabel = {
        let label = UILabel()
        label.text = "Инстаграмм"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var instagramTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Добавить инстаграм"
        textField.textAlignment = .left
        textField.delegate = self
        return textField
    }()

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupSubviews(personPhoto,
                      changePhotoButton,
                      nameLabel,
                      nameTextField,
                      dateLabel,
                      dateTextField,
                      ageLabel,
                      ageTextField,
                      genderLabel,
                      genderTextField,
                      instagramLabel,
                      instagramTextField)
        setupConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    

    // MARK: - Private Methods
    private func setupSubviews(_ subviews: UIView...) {
        subviews .forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(
            title: "Добавить",
            style: .done,
            target: self,
            action: #selector(addPerson)
        )
        
        let cancelButton = UIBarButtonItem(
            title: "Отмена",
            style: .done,
            target: self,
            action: #selector(cancel)
        )
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc private func addPerson() {
        view.endEditing(true)
        completion?(model)
        dismiss(animated: true)
    }
    
    @objc private func cancel() {
        dismiss(animated: true)
    }
}

// MARK: - Constraints
extension AddPersonViewController {
    private func setupConstraints() {
        personPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personPhoto.heightAnchor.constraint(equalToConstant: 100),
            personPhoto.widthAnchor.constraint(equalToConstant: 100),
            personPhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            personPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        changePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            changePhotoButton.topAnchor.constraint(equalTo: personPhoto.bottomAnchor, constant: 10),
            changePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: changePhotoButton.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 20),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10),
            ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
            genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])

        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            genderTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            genderTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        instagramLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            instagramLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 20),
            instagramLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        instagramTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            instagramTextField.topAnchor.constraint(equalTo: instagramLabel.bottomAnchor, constant: 10),
            instagramTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            instagramTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

// MARK: - UIImagePickerControllerDelegate
extension AddPersonViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        personPhoto.image = image
        model.photo = image
        
        guard let image = info[.originalImage] as? UIImage else { return }
        personPhoto.image = image

        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension AddPersonViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        if textField == nameTextField {
            model.name = newValue
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == instagramTextField {
            alertWithCancelButton(title: "Введите username Instagram", message: "", textFieldPlaceholder: "например yashalava2019") { [unowned self] result in
                guard let text = result else { return }
                instagramTextField.text = text
            }
        }
    }
}
