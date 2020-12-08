//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ahda  Dzia Ulhaq on 19/11/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    var right = 0
    var wrong = 0
    
    
    let quiz = [
        Question(text: "Apakah uang jatuh dari pohon?", answer: "False"),
        Question(text: "Apakah malam gelap?", answer: "True"),
        Question(text: "Apakah pintu yg digeser bisa ditarik?", answer: "False"),
        Question(text: "Apakah html termasuk bahasa pemrograman", answer: "False"),
        Question(text: "Apakah luffy menjadi raja bajak laut saat 30 tahun mendatang?", answer: "True"),
        Question(text: "Apakah Indonesia ada di  bumi?", answer: "True"),
        Question(text: "Apakah duren bau?", answer: "True")
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            right += 1
            return true
        } else {
            score -= 1
            wrong += 1
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func getProgress() -> Float {
        Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getRight() -> Int {
        return right
    }
    
    func getWrong() -> Int {
        return wrong
    }
    
}
