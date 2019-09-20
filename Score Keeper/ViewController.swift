//
//  ViewController.swift
//  Score Keeper
//
//  Created by Omar Eldoronki on 9/18/19.
//  Copyright © 2019 Omar Eldoronki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var timer = Timer()
    var timerLabel = UILabel()
    var scoreLabel = UILabel()
    var tapsPerSec = UILabel()
    var scoreLabel2 = UILabel()
    var challenge = UILabel()
    var nameField = UITextField()
    var pointIncrease = UIButton()
    var pointDecrease = UIButton()
    var pointIncrease2 = UIButton()
    var pointDecrease2 = UIButton()
    var reset = UIButton()
    var KSJesko = UIImageView()
    var score = 0
    var score2 = 0
    var name = "Score"
    var name2 = "Score"
    var s1 = "Player 1"
    var s2 = "Player 2"
    var count = 0.0//timer counting
    var whichNameCounter = 0 //used for UITextField to diffrentiate between players 1 & 2
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        
        nameField.delegate = self
        nameField.frame.size.width = 150
        nameField.frame.size.height = 30
        nameField.placeholder = "Enter Player 1's name"
        nameField.font = UIFont.systemFont(ofSize: 15)
        nameField.borderStyle = UITextField.BorderStyle.roundedRect
        nameField.autocorrectionType = UITextAutocorrectionType.yes
        nameField.keyboardType = UIKeyboardType.default
        nameField.returnKeyType = UIReturnKeyType.done
        nameField.clearButtonMode = UITextField.ViewMode.whileEditing;
        nameField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        nameField.sizeToFit()
        nameField.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((nameField.frame.maxX-nameField.frame.minX)/2), y: 230)
        self.view.addSubview(nameField)
        
        scoreLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        addSub1AndCenter(arg: scoreLabel, arg: score, arg: name)
        scoreLabel.center.y = 100
        self.view.addSubview(scoreLabel)
        
        scoreLabel2.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        addSub1AndCenter(arg: scoreLabel2, arg: score2, arg: name2)
        scoreLabel2.center.y = 130
        self.view.addSubview(scoreLabel2)
        
        challenge.textColor = UIColor.black
        challenge.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        self.view.addSubview(challenge)
        
        timerLabel.textColor = UIColor.black
        timerLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        timerLabel.text = "0:30"
        timerLabel.sizeToFit()
        timerLabel.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((timerLabel.frame.maxX-timerLabel.frame.minX)/2), y: 170)
        self.view.addSubview(timerLabel)
        
        tapsPerSec.textColor = UIColor.black
        tapsPerSec.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        tapsPerSec.text = "0"
        tapsPerSec.sizeToFit()
        tapsPerSec.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((tapsPerSec.frame.maxX-tapsPerSec.frame.minX)/2), y: 470)
        self.view.addSubview(tapsPerSec)
        
        pointIncrease.setTitle("Add 1", for: .normal)
        pointIncrease.sizeToFit()
        pointIncrease.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((pointIncrease.frame.maxX-pointIncrease.frame.minX)/2), y: 600)
        pointIncrease.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        pointIncrease.setTitleColor(UIColor.black, for: .normal)
        pointIncrease.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)
        self.view.addSubview(pointIncrease)
        
        pointDecrease.setTitle("Subtract 1", for: .normal)
        pointDecrease.sizeToFit()
        pointDecrease.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((pointDecrease.frame.maxX-pointDecrease.frame.minX)/2), y: 625)
        pointDecrease.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        pointDecrease.setTitleColor(UIColor.black, for: .normal)
        pointDecrease.addTarget(self, action: #selector(self.pressed2), for: .touchUpInside)
        self.view.addSubview(pointDecrease)
        
        pointIncrease2.setTitle("Add 1", for: .normal)
        pointIncrease2.sizeToFit()
        pointIncrease2.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((pointIncrease2.frame.maxX-pointIncrease2.frame.minX)/2), y: 725)
        pointIncrease2.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        pointIncrease2.setTitleColor(UIColor.black, for: .normal)
        pointIncrease2.addTarget(self, action: #selector(self.pressedv2), for: .touchUpInside)
        self.view.addSubview(pointIncrease2)
        
        pointDecrease2.setTitle("Subtract 1", for: .normal)
        pointDecrease2.sizeToFit()
        pointDecrease2.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((pointDecrease2.frame.maxX-pointDecrease2.frame.minX)/2), y: 750)
        pointDecrease2.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        pointDecrease2.setTitleColor(UIColor.black, for: .normal)
        pointDecrease2.addTarget(self, action: #selector(self.pressed2v2), for: .touchUpInside)
        self.view.addSubview(pointDecrease2)
        
        reset.setTitle("Reset scores", for: .normal)
        reset.sizeToFit()
        reset.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((reset.frame.maxX-reset.frame.minX)/2), y: 775)
        reset.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        reset.setTitleColor(UIColor.black, for: .normal)
        reset.addTarget(self, action: #selector(self.resetPress), for: .touchUpInside)
        self.view.addSubview(reset)
        
        KSJesko.image = UIImage(named: "jesko")
        KSJesko.frame = CGRect(x: 60, y: 400, width: 320, height: 180)
        KSJesko.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((KSJesko.frame.maxX-KSJesko.frame.minX)/2), y: 300)
        self.view.addSubview(KSJesko)
    }
    
    @objc func pressed (sender: UIButton!)
    {
//        var timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    
        score+=1
        addSub1AndCenter(arg: scoreLabel, arg: score, arg: name)
    }
    @objc func pressed2 (sender: UIButton!)
    {
        if score > 0
        {
            score-=1
            addSub1AndCenter(arg: scoreLabel, arg: score, arg: name)
        }
    }
    
    @objc func pressedv2 (sender: UIButton!)
    {
        score2+=1
        addSub1AndCenter(arg: scoreLabel2, arg: score2, arg: name2)
    }
    @objc func pressed2v2 (sender: UIButton!)
    {
        if score2 > 0
        {
            score2-=1
            addSub1AndCenter(arg: scoreLabel2, arg: score2, arg: name2)
        }
    }
}
//    func update()
//    {
//        count += 0.01

    @objc func resetPress (sender: UIButton!)
    {
        score = 0
        score2 = 0
        addSub1AndCenter(arg: scoreLabel, arg: score, arg: name)
        addSub1AndCenter(arg: scoreLabel2, arg: score2, arg: name2)
    }
    func addSub1AndCenter(arg UILbl: UILabel, arg points: Int, arg name: String)
    {
        UILbl.text = "\(name): \(points)"
        UILbl.textAlignment = NSTextAlignment.center
        UILbl.sizeToFit()
        UILbl.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((UILbl.frame.maxX-UILbl.frame.minX)/2), y: UILbl.frame.origin.y)
        if points > 0 && points % 7 == 0
        {
            UILbl.textColor = UIColor.yellow
        }
        else
        {
            UILbl.textColor = UIColor.black
        }
        if (score > score2)
        {
            challenge.text = "\(s1) is in the lead."
        }
        else if (score < score2)
        {
            challenge.text = "\(s2) is in the lead."
        }
        else if (score == score2 && score != 0 && score2 != 0)
        {
            challenge.text = "\(s1) and \(s2) are tied."
        }
        else
        {
            challenge.text = "Can you tap faster than the Jesko?"
        }
        challenge.textAlignment = NSTextAlignment.center
        challenge.sizeToFit()
        challenge.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((challenge.frame.maxX-challenge.frame.minX)/2), y: 60)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (whichNameCounter == 0)
        {
            name = String(nameField.text ?? "Score")
            s1 = name
            nameField.text = ""
            nameField.placeholder = "Enter player 2's name"
            addSub1AndCenter(arg: scoreLabel, arg: score, arg: name)
            
        }
        if (whichNameCounter == 1)
        {
            name2 = String(nameField.text ?? "Score")
            s2 = name2
            nameField.isHidden = true
            addSub1AndCenter(arg: scoreLabel2, arg: score2, arg: name2)
        }
        whichNameCounter+=1
        return true
    }
    
}

