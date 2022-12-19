//
//  Model.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 17.12.2022.
//

import Foundation

struct Access {
    let login = "User"
    let password = "12345"
}

struct Customer {
    var fullName = String()
    var guestsNumber = String()
    var tableNumber = String()
    
    var tableReserve = Bool()
    var prepayment = Bool()
    var vipRoom = Bool()
}

struct Menu {
    let name: String
    let coast: String
    let ingredients: String
    
    static func getMenu() -> [Menu] {
        [Menu(
            name: "Цезарь",
            coast: "300",
            ingredients: "помидор, салат Айсберг, сухарики, курица"
        ),
         Menu(
            name: "Греческий",
            coast: "400",
            ingredients: "помидор, огурец, сухарики, лук, фета, маслины")
         ]
    }
}
