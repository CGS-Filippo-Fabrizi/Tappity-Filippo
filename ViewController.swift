//
//  ViewController.swift
//  Tappity
//
//  Created by Filippo Fabrizi on 30/5/17.
//  Copyright © 2017 Filippo Fabrizi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var timeLeft = 30
    var colorArray = [UIColor.orange, UIColor.black, UIColor.red, UIColor.blue, UIColor.brown, UIColor.yellow]
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBAction func tapButton(_ sender: UIButton) {
        
        
        let randomColor = arc4random_uniform(5)
        
        
        view.backgroundColor = colorArray[Int(randomColor)]
        sender.setTitleColor(colorArray[Int(randomColor)], for: .normal)
        
        if score < 1 {
            
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
            
            
            print("I like my italians nice and fried")
            
        }
        
        // Find the button's width and height
        let buttonWidth = sender.frame.width
        let buttonHeight = sender.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = sender.superview!.bounds.width
        let viewHeight = sender.superview!.bounds.height
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        
        // Offset the button's center by the random offsets.
        sender.center.x = xoffset + buttonWidth / 2
        sender.center.y = yoffset + buttonHeight / 2
        
        
        score += 1
        scoreLabel.text = "\(score)"
    }
    
    func update() {
        
        
        
        timeLeft -= 1
        timeLabel.text = "\(timeLeft)"
        
        if timeLeft == 0 {
            
            timer.invalidate()
            
            let alert = UIAlertController(title: "Game Over", message: "Your score was \(score)", preferredStyle: UIAlertControllerStyle.actionSheet)
            alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) in self.reset()}))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func reset() {
        
        timeLeft = 30
        score = 0
        timeLabel.text = "30"
        scoreLabel.text = "0"
        
        button.center.x = button.superview!.bounds.width / 2
        button.center.x = button.superview!.bounds.height  / 2
        
        
    }
}
