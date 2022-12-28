//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by MacBook on 28/12/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answers = a
        self.rightAnswer = correctAnswer
    }
}
