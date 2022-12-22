//
//  PaymentViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 16.12.2022.
//

import UIKit
// 4.Добавить третий экран счёт где выводим фио , номер стола и сумма

final class PaymentViewController: UIViewController {
    
    @IBOutlet private var positionOrderOne: UILabel!
    @IBOutlet private var coastPositionOrderOne: UILabel!
    @IBOutlet private var ingredientsPositionOrderOne: UILabel!
    
    @IBOutlet private var positionOrderTwo: UILabel!
    @IBOutlet private var coastPositionOrderTwo: UILabel!
    @IBOutlet private var ingredientsPositionOrderTwo: UILabel!
    
    @IBOutlet private var fullNameLabel: UILabel!
    @IBOutlet private var tableNumberLabel: UILabel!
    @IBOutlet private var guestsCount: UILabel!
    @IBOutlet private var totalCoastLabel: UILabel!
    
    var fullName: String!
    var modelPayment = Customer()
    
    private let modelOrder = Menu.getMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPositionOrderOne()
        setupPositionOrderTwo()
        setupFullNameLabel()
        setupTableNumberLabel()
        setupTableNumberLabel()
        setupGuestsCount()
        setupTotalCoastLabel()
        
    
    }
    
    private func setupPositionOrderOne() {
        positionOrderOne.text = modelOrder[0].name
        coastPositionOrderOne.text = modelOrder[0].coast
        ingredientsPositionOrderOne.text = modelOrder[0].ingredients
    }
    
    private func setupPositionOrderTwo() {
        positionOrderTwo.text = modelOrder[1].name
        coastPositionOrderTwo.text = modelOrder[1].coast
        ingredientsPositionOrderTwo.text = modelOrder[1].ingredients
    }
    
    private func setupFullNameLabel() {
        fullNameLabel.text = modelPayment.fullName
    }
    
    private func setupTableNumberLabel() {
        tableNumberLabel.text = modelPayment.tableNumber
    }
    
    private func setupGuestsCount() {
        guestsCount.text = modelPayment.guestsNumber
    }
    
    private func setupTotalCoastLabel() {
        totalCoastLabel.layer.masksToBounds = true
        totalCoastLabel.layer.cornerRadius = 20
        guard let numberOne = Int(coastPositionOrderOne.text ?? "") else { return }
        guard let numberTwo = Int(coastPositionOrderTwo.text ?? "") else { return }
        totalCoastLabel.text = String("Итого \(numberOne + numberTwo) р")
        
    }
}
