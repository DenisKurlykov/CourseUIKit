//
//  ViewController.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 09.12.2022.
//

import UIKit
// 5. Создать второе приложение MVC у которого на экране будет кнопка "начать" которая вызывает Алерт с сообщением "введите слово"
// 6. Нужно ввести "leohl" в Алерт нажимаете "ок" отдаете контролеру а контролер отдаст это в модель которая из буквосочетания "leohl" вернет слово "hello" контролеру а контролер отдаст это лейблу и отобразит это на экране

final class ViewController: UIViewController {
    
    let model = Hello()
    
    private var resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupResultLabel()
        startButton()
    }
    
    // MARK: - Private Method
    private func setupResultLabel() {
        resultLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 300, height: 50))
        resultLabel.backgroundColor = .white
        resultLabel.textAlignment = .center
        resultLabel.text = model.textLabel
        resultLabel.adjustsFontSizeToFitWidth = true
        resultLabel.layer.cornerRadius = 20
        view.addSubview(resultLabel)
    }
    
    private func startButton() {
        let button = UIButton(frame: CGRect(x: 135, y: 300, width: 125, height: 50))
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(startButtonPressed) , for: .touchUpInside)
        button.layer.cornerRadius = 10
        view.addSubview(button)

    }
}

 // MARK: - Extension
extension ViewController {
    @objc private func startButtonPressed() {
        let alert = UIAlertController(title: "Введите ", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let okButton = UIAlertAction(title: "Ок", style: .default) { [weak resultLabel] _ in
            guard let text = alert.textFields?.first?.text else { return }
            guard let label = resultLabel else { return }
            label.text = self.model.checkingTextLabel(text: text)
        }
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

