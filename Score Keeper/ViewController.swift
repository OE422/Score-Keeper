//
//  ViewController.swift
//  Score Keeper
//
//  Created by Omar Eldoronki on 9/18/19.
//  Copyright © 2019 Omar Eldoronki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scoreLabel = UILabel()
    var scoreLabel2 = UILabel()
    var challenge = UILabel()
    var pointIncrease = UIButton()
    var pointDecrease = UIButton()
    var pointIncrease2 = UIButton()
    var pointDecrease2 = UIButton()
    var KSJesko = UIImageView()
    var score = 0
    var score2 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        addSub1AndCenter(arg: scoreLabel, arg: score)
        self.view.addSubview(scoreLabel)
        
        scoreLabel2.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        addSub1AndCenter(arg: scoreLabel2, arg: score2)
        self.view.addSubview(scoreLabel2)
        
        challenge.textColor = UIColor.black
        challenge.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        challenge.text = "Can you tap faster than the Jesko?"
        challenge.textAlignment = NSTextAlignment.center
        challenge.sizeToFit()
        challenge.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((challenge.frame.maxX-challenge.frame.minX)/2), y: KSJesko.frame.maxY + 60)
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
    func addSub1AndCenter(arg UILbl: UILabel, arg points: Int)
    {
        UILbl.text = "Score: \(score)"
        UILbl.textAlignment = NSTextAlignment.center
        UILbl.sizeToFit()
        UILbl.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((UILbl.frame.maxX-UILbl.frame.minX)/2), y: 100)
        if points > 0 && points % 7 == 0
        {
            UILbl.textColor = UIColor.yellow
        }
        else
        {
            UILbl.textColor = UIColor.black
        }
    }


}

