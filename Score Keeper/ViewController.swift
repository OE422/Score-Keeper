//
//  ViewController.swift
//  Score Keeper
//
//  Created by Omar Eldoronki on 9/18/19.
//  Copyright © 2019 Omar Eldoronki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var scoreLabel = UILabel()
    var scoreLabel2 = UILabel()
    var challenge = UILabel()
    var nameField = UITextField()
    var nameField2 = UITextField()
    var pointIncrease = UIButton()
    var pointDecrease = UIButton()
    var pointIncrease2 = UIButton()
    var pointDecrease2 = UIButton()
    var reset = UIButton()
    var KSJesko = UIImageView()
    var score = 0
    var score2 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        nameField.delegate = self
        nameField2.delegate = self
        
        scoreLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        addSub1AndCenter(arg: scoreLabel, arg: score)
        scoreLabel.center.y = 100
        self.view.addSubview(scoreLabel)
        
        scoreLabel2.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        addSub1AndCenter(arg: scoreLabel2, arg: score2)
        scoreLabel2.center.y = 130
        self.view.addSubview(scoreLabel2)
        
        challenge.textColor = UIColor.black
        challenge.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        self.view.addSubview(challenge)
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
        score+=1
        addSub1AndCenter(arg: scoreLabel, arg: score)
    }
    @objc func pressed2 (sender: UIButton!)
    {
        if score > 0
        {
            score-=1
            addSub1AndCenter(arg: scoreLabel, arg: score)
        }
    }
    
    @objc func pressedv2 (sender: UIButton!)
    {
        score2+=1
        addSub1AndCenter(arg: scoreLabel2, arg: score2)
    }
    @objc func pressed2v2 (sender: UIButton!)
    {
        if score2 > 0
        {
            score2-=1
            addSub1AndCenter(arg: scoreLabel2, arg: score2)
        }
    }
    @objc func resetPress (sender: UIButton!)
    {
        score = 0
        score2 = 0
        addSub1AndCenter(arg: scoreLabel, arg: score)
        addSub1AndCenter(arg: scoreLabel2, arg: score2)
    }
    func addSub1AndCenter(arg UILbl: UILabel, arg points: Int)
    {
        UILbl.text = "Score: \(points)"
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
            challenge.text = "Player 1 is in the lead."
        }
        else if (score < score2)
        {
            challenge.text = "Player 2 is in the lead."
        }
        else if (score == score2 && score != 0 && score2 != 0)
        {
            challenge.text = "Player 1 and player 2 are tied."
        }
        else
        {
            challenge.text = "Can you tap faster than the Jesko?"
        }
        challenge.textAlignment = NSTextAlignment.center
        challenge.sizeToFit()
        challenge.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((challenge.frame.maxX-challenge.frame.minX)/2), y: 60)
        
        
        
    }


}

