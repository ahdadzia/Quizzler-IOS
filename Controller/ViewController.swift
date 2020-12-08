//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuiz()
       
    }
   
    @IBAction func buttonAnswer(_ sender: UIButton) {
        timer.invalidate()
        
        let userAnswer = sender.currentTitle!
        let actualAnswer = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateQuiz), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateQuiz() {
        quizLabel.text = quizBrain.getQuestionText()
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        rightLabel.text = "Right Answer: \(quizBrain.getRight())"
        wrongLabel.text = "Wrong Answer: \(quizBrain.getWrong())"
    }
    
}

