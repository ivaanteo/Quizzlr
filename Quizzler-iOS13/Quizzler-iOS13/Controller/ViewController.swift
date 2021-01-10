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
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        if quizBrain.checkAnswer(userAnswer){
            sender.backgroundColor = UIColor.systemGreen
        }
        else{
            sender.backgroundColor = UIColor.systemRed
        }
        
        /*if userAnswer == actualAnswer{
            sender.backgroundColor = UIColor.systemGreen
        }
        else{
            sender.backgroundColor = UIColor.systemRed
        }*/
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        quizBrain.updateQuestionNumber()
    }
    @objc func updateUI(){
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        firstButton.setTitle( quizBrain.getQuestionAnswer1(), for: .normal)
        secondButton.setTitle( quizBrain.getQuestionAnswer2(), for: .normal)
        thirdButton.setTitle( quizBrain.getQuestionAnswer3(), for: .normal)
        scoreLabel.text = "Score: \(String(quizBrain.getScore()))"
    }
}

