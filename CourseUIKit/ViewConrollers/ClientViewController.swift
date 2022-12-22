//
//  ClientViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 15.12.2022.
//

import UIKit
// 2.Создать второй экран Cafe где нужно регистрировать гостя поля для ввода фио и через свитчи была ли предоплата , заказывали ли стол (да или нет )
// 3. Поля для ввода номера стола

// 5. Добавить кнопку «выставить счёт» расположить на втором экране и по нажатию выкидывать Алерт продолжить да или нет, если нет то убираем Алерт если да то переходим на третий экран

final class ClientViewController: UIViewController {
    
    // MARK: - IBAOutlets
    @IBOutlet private var fullNameTextField: UITextField!
    @IBOutlet private var guestsNumberTextField: UITextField!
    @IBOutlet private var tableNumberTextField: UITextField!
    
    // MARK: - Public Properties
    var model = Customer()
    
    // MARK: - Life Cycles Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFullNameTF()
        setupGuestsNumberTF()
        setupTableNumberTF()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBAction
    @IBAction func paymentButtonPressed(_ sender: Any) {
        initModel()
        alertWithCancel(title: "Выставить счет", message: "") {
            guard let next = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as? PaymentViewController else { return }
            self.navigationController?.pushViewController(next, animated: true)
            next.modelPayment = self.model
        }
    }
    
    @IBAction func switchTableReserve(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            model.tableReserve = true
        case false:
            model.tableReserve = false
        }
    }
    
    @IBAction func switchPrepayment(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            model.prepayment = true
        case false:
            model.prepayment = false
        }
    }
    
    @IBAction func switchVipRoom(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            model.vipRoom = true
        case false:
            model.vipRoom = false
        }
    }
    
    // MARK: - Private Methods
    private func setupFullNameTF() {
        fullNameTextField.text = ""
        fullNameTextField.placeholder = "Введите фио"
    }
    
    private func setupGuestsNumberTF() {
        guestsNumberTextField.text = ""
        guestsNumberTextField.placeholder = "Количество гостей"
        guestsNumberTextField.keyboardType = .numberPad
    }
    
    private func setupTableNumberTF() {
        tableNumberTextField.text = ""
        tableNumberTextField.placeholder = "Стол номер"
        tableNumberTextField.keyboardType = .numberPad
    }
    
    private func initModel() {
        guard let fullNameTF = fullNameTextField.text else { return }
        model.fullName = fullNameTF
        
        guard let guestsNumberTF = guestsNumberTextField.text else { return }
        model.guestsNumber = guestsNumberTF
        
        guard let tableNumberTF = tableNumberTextField.text else { return }
        model.tableNumber = tableNumberTF
    }
}
