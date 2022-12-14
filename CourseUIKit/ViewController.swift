//
//  ViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 09.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private Properties
    private var greetingLabel = UILabel()
    private var resultAdditionLabel = UILabel()
    private var guessNumberLabel = UILabel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupGreetingLabel()
        setupResultAdditionLabel()
        setupGuessNumberLabel()
        additionButton()
        guessNumberButton ()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showAlertGreeting()
    }
    
    // MARK: - Private Method
   private func setupGreetingLabel() {
        greetingLabel = UILabel(frame: CGRect(x: 50, y: 60, width: 300, height: 50))
        greetingLabel.backgroundColor = .white
        greetingLabel.textAlignment = .center
        greetingLabel.text = ""
        greetingLabel.isHidden = false
       greetingLabel.layer.cornerRadius = 20
       greetingLabel.layer.masksToBounds = true
        view.addSubview(greetingLabel)
    }
    
    private func setupResultAdditionLabel() {
        resultAdditionLabel = UILabel(frame: CGRect(x: 50, y: 125, width: 300, height: 50))
        resultAdditionLabel.backgroundColor = .white
        resultAdditionLabel.textAlignment = .center
        resultAdditionLabel.adjustsFontSizeToFitWidth = true
        resultAdditionLabel.text = ""
        resultAdditionLabel.isHidden = false
        resultAdditionLabel.layer.masksToBounds = true
        resultAdditionLabel.layer.cornerRadius = 20
        view.addSubview(resultAdditionLabel)
    }
    
    private func setupGuessNumberLabel() {
        guessNumberLabel = UILabel(frame: CGRect(x: 50, y: 190, width: 300, height: 50))
        guessNumberLabel.backgroundColor = .white
        guessNumberLabel.textAlignment = .center
        guessNumberLabel.adjustsFontSizeToFitWidth = true
        guessNumberLabel.text = ""
        guessNumberLabel.isHidden = false
        guessNumberLabel.layer.masksToBounds = true
        guessNumberLabel.layer.cornerRadius = 20
        view.addSubview(guessNumberLabel)
    }
    
    private func additionButton () {
        let button = UIButton(frame: CGRect(x: 14, y: 300, width: 125, height: 50))
        button.setTitle("Сумма чисел", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(additionButtonPressed), for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func guessNumberButton () {
        let button = UIButton(frame: CGRect(x: 250, y: 300, width: 125, height: 50))
        button.setTitle("Угадай число", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(guessNumberButtonPressed), for: .touchUpInside)
        view.addSubview(button)
    }
}

// MARK: - Extension
extension ViewController {
    private func showAlertGreeting() {
        self.alertWithoutCancelButton(title: "Пивет", message: "Введите полное имя", textFieldPlaceholder: " ") { [weak greetingLabel] result in
            guard let label = greetingLabel else { return }
            label.text = result
        }
    }
    
    @objc private func additionButtonPressed(sender: UIButton) {
        self.alertWithToTextFields(title: "Введите два числа", message: "", textFieldPlaceholderOne: "Первое число", textFieldPlaceholderTwo: "Второе число") { result1, result2 in
            guard let numberOne = Int(result1 ?? "0"),
                  let numberTwo = Int(result2 ?? "0")
            else {
                return
            }
            self.resultAdditionLabel.text = ("\(numberOne + numberTwo)")
        }
    }
    
    @objc private func guessNumberButtonPressed(sender: UIButton) {
        let guessNumber = Int.random(in: 1...5)
        
        self.alertWithoutCancelButton(title: "Угадай число", message: "Введите число от 1 до 5", textFieldPlaceholder: "Введите число") { [weak guessNumberLabel] result in
            guard let label = guessNumberLabel else { return }
            guard let number = Int(result ?? "0") else { return }
            if guessNumber == number {
                label.text = "Вы угадали. Было загадано число \(guessNumber)"
            } else {
                label.text = "Вы не угадали. Было загадано число \(guessNumber)"
            }
        }
    }
}
