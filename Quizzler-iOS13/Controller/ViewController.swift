//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qustionOt: UILabel!
    @IBOutlet weak var trueBtnOt: UIButton!
    @IBOutlet weak var falseBtnOt: UIButton!
    @IBOutlet weak var progressViewOt: UIProgressView!
    
    var quizBrain = QuizBrain()
    var totalTime = 0.4
    var timer = Timer()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    
    @IBAction func answerBtn(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
//        let actualAnswer = quiz[questionNumber].answer
        let userGotItRight = quizBrain.checkAnswer(input: userAnswer!)
        
        if userGotItRight {
            score += 10
            sender.backgroundColor = UIColor.green
        } else {
            score -= 5
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQustion()
        
        trueBtnOt.isEnabled = false
        falseBtnOt.isEnabled = false
                
        timer = Timer.scheduledTimer(timeInterval: totalTime, target: self, selector: #selector(timerFinished), userInfo: nil, repeats: false)
    }
    
    @objc func timerFinished() {
        if quizBrain.questionNumber < quizBrain.quiz.count {
            updateUI()
        } else {
            //0quizBrain.displayFinalScore()
        }
        
        trueBtnOt.isEnabled = true
        falseBtnOt.isEnabled = true
    }
    
    func updateUI() {
        //if questionNumber < quiz.count {
        qustionOt.text = quizBrain.getQustionText()
        progressViewOt.progress = quizBrain.getProgress()
        
            trueBtnOt.backgroundColor = UIColor.clear
            falseBtnOt.backgroundColor = UIColor.clear
        //}
    }
    

}
