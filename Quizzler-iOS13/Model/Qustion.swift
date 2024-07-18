//
//  Qustion.swift
//  Quizzler-iOS13
//
//  Created by Anas Salah on 17/07/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}


