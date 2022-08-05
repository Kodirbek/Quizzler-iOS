//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
        
        //updateUI() PS. We cancelled out this line as this function was already called in Timer after 0.3 seconds of delay
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText ()
        progressBar.progress = quizBrain.getProgress ()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { }   PS. This is an alternative to the Timer function used in IBAction
        self.trueButton.backgroundColor = UIColor.clear
        self.falseButton.backgroundColor = UIColor.clear
        
    }
    
}

