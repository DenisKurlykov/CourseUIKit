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
        showAlertGreeting(with: "Привет", and: "Введи полное имя")
    }
    
    // MARK: - Private Method
   private func setupGreetingLabel() {
        greetingLabel = UILabel(frame: CGRect(x: 50, y: 60, width: 300, height: 50))
        greetingLabel.backgroundColor = .white
        greetingLabel.textAlignment = .center
        greetingLabel.text = ""
        greetingLabel.isHidden = true
        view.addSubview(greetingLabel)
    }
    
    private func setupResultAdditionLabel() {
        resultAdditionLabel = UILabel(frame: CGRect(x: 50, y: 125, width: 300, height: 50))
        resultAdditionLabel.backgroundColor = .white
        resultAdditionLabel.textAlignment = .center
        resultAdditionLabel.adjustsFontSizeToFitWidth = true
        resultAdditionLabel.text = ""
        resultAdditionLabel.isHidden = true
        view.addSubview(resultAdditionLabel)
    }
    
    private func setupGuessNumberLabel() {
        guessNumberLabel = UILabel(frame: CGRect(x: 50, y: 190, width: 300, height: 50))
        guessNumberLabel.backgroundColor = .white
        guessNumberLabel.textAlignment = .center
        guessNumberLabel.adjustsFontSizeToFitWidth = true
        guessNumberLabel.text = ""
        guessNumberLabel.isHidden = true
        view.addSubview(guessNumberLabel)
    }
    
    private func additionButton () {
        let button = UIButton(frame: CGRect(x: 14, y: 300, width: 125, height: 50))
        button.setTitle("Сумма чисел", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(additionButtonPressed), for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func guessNumberButton () {
        let button = UIButton(frame: CGRect(x: 250, y: 300, width: 125, height: 50))
        button.setTitle("Угадай число", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(guessNumberButtonPressed), for: .touchUpInside)
        view.addSubview(button)
    }
}

// MARK: - Extension
extension ViewController {
    private func showAlertGreeting(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            self?.greetingLabel.text = alert.textFields?.first?.text
            self?.greetingLabel.isHidden = false
        }
        alert.addAction(okButton)
        alert.addTextField()
        present(alert, animated: true)
    }
    
    @objc private func additionButtonPressed(sender: UIButton) {
        let alert = UIAlertController(title: "Введите два числа", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            guard let numberOne = Int(alert.textFields?.first?.text ?? "0"),
                  let numberTwo = Int(alert.textFields?.last?.text ?? "0")
            else {
                return
            }
            self?.resultAdditionLabel.isHidden = false
            self?.resultAdditionLabel.text = ("\(numberOne + numberTwo)")
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField { numberOne in
            numberOne.placeholder = "Первое число"
        }
        alert.addTextField { numberTwo in
            numberTwo.placeholder = "Второе число"
        }
        
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }
    
    @objc private func guessNumberButtonPressed(sender: UIButton) {
        let guessNumber = Int.random(in: 1...5)
        
        let alert = UIAlertController(title: "Угадай число", message: "Введите число от 1 до 5", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            guard let number = Int(alert.textFields?.first?.text ?? "0") else { return }
            if guessNumber == number {
                self?.guessNumberLabel.text = "Вы угадали. Было загадано число \(guessNumber)"
            } else {
                self?.guessNumberLabel.text = "Вы не угадали. Было загадано число \(guessNumber)"
            }
            self?.guessNumberLabel.isHidden = false
        }
        alert.addAction(okButton)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelButton)
        
        alert.addTextField { number in
            number.placeholder = "Введите число"
        }
        
        present(alert, animated: true)
    }
}
