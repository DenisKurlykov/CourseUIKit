//
//  Model.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 12.12.2022.
//

import Foundation

struct Hello {
    var textLabel = ""
    
    func checkingTextLabel(text: String) -> String {
        switch text {
        case "leohl": return "Hello"
        default: return "Вы ввели не верное слово"
        }
    }
}
