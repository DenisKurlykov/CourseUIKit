//
//  BirthdayViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 26.12.2022.
//

import UIKit

final class BirthdayViewController: UIViewController {
    var model = Customer()
    
    // MARK: - Private Properties
    private lazy var contactPhoto: UIImageView = {
        let image = UIImageView()
        image.image = model.photo
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 25
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = model.name
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private let contactInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "10 марта в среду исполнится 25 лет"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    private let daysToBirthdayLabel: UILabel = {
       let label = UILabel()
        label.text = "18 дней"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSubviews(
            contactPhoto,
            nameLabel,
            contactInfoLabel,
            daysToBirthdayLabel)
        setupConstraints()
        setupNavigationBar()
    }

    // MARK: - Private Methods
    private func setupSubviews(_ subviews: UIView...) {
        subviews .forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setupNavigationBar() {
        title = "Birthday"
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.9482137561, green: 0.9601507783, blue: 0.9599407315, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewPerson)
        )
    }
    
    @objc private func addNewPerson() {
        let rootVC = AddPersonViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        rootVC.completion = { [weak self] value in
            self?.nameLabel.text = value.name
            self?.contactPhoto.image = value.photo
        }
        present(navVC, animated: true)
    }
}

// MARK: - Constraints
extension BirthdayViewController {
    private func setupConstraints() {
        contactPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactPhoto.heightAnchor.constraint(equalToConstant: 50),
            contactPhoto.widthAnchor.constraint(equalToConstant: 50),
            contactPhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            contactPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contactPhoto.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: contactPhoto.topAnchor, constant: 0)
        ])
        
        contactInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactInfoLabel.leadingAnchor.constraint(equalTo: contactPhoto.trailingAnchor, constant: 12),
            contactInfoLabel.bottomAnchor.constraint(equalTo: contactPhoto.bottomAnchor, constant: 0)
        ])
        
        daysToBirthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        daysToBirthdayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        daysToBirthdayLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 0)
        ])
    }
}
