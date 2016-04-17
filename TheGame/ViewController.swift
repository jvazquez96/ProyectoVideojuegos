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
	
	var iNumberQuestion = 1
	var Timer: NSTimer?
    var Time = 20
	var iQuestion: Int = 0
	var dataModel = DataModel()
	//var Level = [Levels]()
	//var a = Levels(Level: 1)
	var ActualLevel = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		numberofquestionLabel.adjustsFontSizeToFitWidth = true
		questionLabel.adjustsFontSizeToFitWidth = true
//		iNumberQuestion = 1
//		iQuestion = 0
//		ActualLevel = 0
		//setValues()
		updateLabels()
		Timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("fire:"), userInfo: nil, repeats: true)
	}
	func setValues(){
		dataModel.Level[ActualLevel].listofQuestions[0].setTitle("adasdasd")
		dataModel.Level[ActualLevel].listofQuestions[0].addAnswer("1")
		dataModel.Level[ActualLevel].listofQuestions[0].addAnswer("2")
		dataModel.Level[ActualLevel].listofQuestions[0].addAnswer("3")
		dataModel.Level[ActualLevel].listofQuestions[0].addAnswer("4")
		let question = Questions()
		question.setTitle("Hola")
		dataModel.Level[ActualLevel].listofQuestions.append(question)
	}
	

	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func updateLabels(){
		//If we have still questions to display
			numberofquestionLabel.text = ("\(iNumberQuestion)")
			print("Amount of questions:")
			print("\(dataModel.Level[ActualLevel].listofQuestions.count)")
			questionLabel.text = dataModel.Level[ActualLevel].listofQuestions[iQuestion].getQuestion()
			button1.setTitle(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(0), forState: .Normal)
			button2.setTitle(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(1), forState: .Normal)
			button3.setTitle(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(2), forState: .Normal)
			button4.setTitle(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(3), forState: .Normal)

	}
	
	func fire(Timer:NSTimer){
        if Time >= 0{
            countdownLabel?.text = String(--Time) + "''" 
        }else{
            Timer.invalidate()
            questionLabel.text = "Out of time"
        }
    }
	
	@IBAction func button1Pressed(){
		if dataModel.Level[ActualLevel].listofQuestions[iQuestion].checkAnswer(1){
			
		}else{
			button1.enabled = false
		}
	}
	@IBAction func button2Pressed(){
		if dataModel.Level[ActualLevel].listofQuestions[iQuestion].checkAnswer(2){
		
		}else{
			button2.enabled = false
		}
	}
	@IBAction func button3Pressed(){
		if dataModel.Level[ActualLevel].listofQuestions[iQuestion].checkAnswer(3){
		
		}else{
			button3.enabled = false;
		}
	}
	@IBAction func button4Pressed(){
		if dataModel.Level[ActualLevel].listofQuestions[iQuestion].checkAnswer(4){
			
		}else{
			button4.enabled = false;
		}
	
	}
	
	
	
	
}