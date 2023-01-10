//
//  Model.swift
//  CourseUIKit
//
//  Created by Денис Курлыков on 26.12.2022.
//

import Foundation
import UIKit


struct UserAccess {
    let login: String
    let password: String
}

struct Customer {
    var name = ""
    var photo = UIImage(named: "person")
}

//{
//    images : [
//        {
//            filename : "person.jpeg",
//            idiom : "universal",
//            scale : "1x"
//        },
//        {
//            idiom : "universal",
//            scale : "2x"
//        },
//        {
//            idiom : "universal",
//            scale : "3x"
//        }
//    ],
//    info : {
//        author : "xcode",
//        version : 1
//    }
//}
