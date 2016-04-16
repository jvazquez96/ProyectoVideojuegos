//
//  ViewController.swift
//  TheGame
//
//  Created by Jorge Vazquez on 4/13/16.
//  Copyright © 2016 Jorge Vazquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var numberofquestionLabel: UILabel!
	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var button3: UIButton!
	@IBOutlet weak var button4: UIButton!
	@IBOutlet weak var countdownLabel: UILabel!
	
	
	var iNumberQuestion: Int!
	var Timer: NSTimer?
    var Time = 20
	
	var Question = Questions()
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		numberofquestionLabel.adjustsFontSizeToFitWidth = true
		questionLabel.adjustsFontSizeToFitWidth = true
		let size = questionLabel.font.pointSize
		print(size)
		iNumberQuestion = 1
		updateLabels()
		Timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("fire:"), userInfo: nil, repeats: true)
	}

	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func updateLabels(){
		//If we have still questions to display
			numberofquestionLabel.text = ("\(iNumberQuestion)")
			questionLabel.text = Question.Question
			button1.setTitle(Question.getAnswer(0), forState: .Normal)
			button2.setTitle(Question.getAnswer(1), forState: .Normal)
			button3.setTitle(Question.getAnswer(2), forState: .Normal)
			button4.setTitle(Question.getAnswer(3), forState: .Normal)

	}
	
	func fire(Timer:NSTimer){
        if Time >= 0{
            countdownLabel?.text = String(--Time) + "''" 
        }else{
            Timer.invalidate()
            questionLabel.text = "Out of time"
        }
    }
}