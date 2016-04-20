//
//  MathViewController.swift
//  TheGame
//
//  Created by Jorge Vazquez on 4/13/16.
//  Copyright © 2016 Jorge Vazquez. All rights reserved.
//

import UIKit

class MathViewController: UIViewController {

	@IBOutlet weak var numberofquestionLabel: UILabel!
	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var button3: UIButton!
	@IBOutlet weak var button4: UIButton!
	@IBOutlet weak var countdownLabel: UILabel!
	@IBOutlet weak var backgroundImageView: UIImageView!
	
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
		setValues()
		//updateLabels()
		//Timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("fire:"), userInfo: nil, repeats: true)
		button1.hidden = true
		button2.hidden = true
		button3.hidden = true
		button4.hidden = true
		numberofquestionLabel.hidden = true
		questionLabel.hidden = true
		countdownLabel.hidden = true
	}
	
	func unblockbuttons(){
		button1.enabled = true
		button2.enabled = true
		button3.enabled = true
		button4.enabled = true
	}
	
	
	func setValues(){
		dataModel.Level[ActualLevel].listofQuestions[0].setTitle("2+2")
		dataModel.Level[ActualLevel].listofQuestions[0].setAnswer("1",iIndex: 0)
		dataModel.Level[ActualLevel].listofQuestions[0].setAnswer("2",iIndex: 1)
		dataModel.Level[ActualLevel].listofQuestions[0].setAnswer("3",iIndex: 2)
		dataModel.Level[ActualLevel].listofQuestions[0].setAnswer("4",iIndex: 3)
		dataModel.Level[ActualLevel].listofQuestions[0].setIndex(4)
		let question = Questions()
		question.setTitle("3+5")
		question.setAnswer("8",iIndex:0)
		question.setAnswer("2",iIndex:1)
		question.setAnswer("9",iIndex:2)
		question.setAnswer("7",iIndex: 3)
		question.setIndex(1)
		let question2 = Questions()
		question2.setTitle("7+3")
		question2.setAnswer("8",iIndex: 0)
		question2.setAnswer("9",iIndex:1)
		question2.setAnswer("10",iIndex:2)
		question2.setAnswer("6",iIndex:3)
		question2.setIndex(3)
		let question3 = Questions()
		question3.setTitle("8+7")
		question3.setAnswer("14",iIndex:0)
		question3.setAnswer("15",iIndex:1)
		question3.setAnswer("16",iIndex:2)
		question3.setAnswer("17",iIndex:3)
		question3.setIndex(2)
		let question4 = Questions()
		question4.setTitle("5+9")
		question4.setAnswer("13",iIndex:0)
		question4.setAnswer("12",iIndex:1)
		question4.setAnswer("16",iIndex:2)
		question4.setAnswer("14",iIndex:3)
		question4.setIndex(4)
		dataModel.Level[0].listofQuestions.append(question)
		dataModel.Level[0].listofQuestions.append(question2)
		dataModel.Level[0].listofQuestions.append(question3)
		dataModel.Level[0].listofQuestions.append(question4)
		for var index = 0; index < 5;++index{
			print("First answer for each question:  \(dataModel.Level[0].listofQuestions[index].getAnswer(0))")
		}
		print("Added questions: \(dataModel.Level[0].listofQuestions.count)")
	}
	

	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func updateLabels(){
		//If we have still questions to display
		if (dataModel.Level[ActualLevel].listofQuestions.count > 0){
			numberofquestionLabel.text = ("Question \(iNumberQuestion)")
			questionLabel.text = dataModel.Level[ActualLevel].listofQuestions[iQuestion].getQuestion()
			print("Number of question: \(iQuestion)")
			print("Answer: \(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(0))")
			button1.setTitle(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(0), forState: .Normal)
			button2.setTitle(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(1), forState: .Normal)
			button3.setTitle(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(2), forState: .Normal)
			button4.setTitle(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(3), forState: .Normal)
			}

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
			//dataModel.Level[ActualLevel].listofQuestions.removeAtIndex(iQuestion)
			++iQuestion
			print("Number of question:  \(iQuestion)"  )
			updateLabels()
			unblockbuttons()
		}else{
			
			button1.enabled = false
		}
	}
	@IBAction func button2Pressed(){
		if dataModel.Level[ActualLevel].listofQuestions[iQuestion].checkAnswer(2){
			//dataModel.Level[ActualLevel].listofQuestions.removeAtIndex(iQuestion)
			++iQuestion
			print("Number of question:  \(iQuestion)"  )
			updateLabels()
			unblockbuttons()
		}else{
			button2.enabled = false
		}
	}
	@IBAction func button3Pressed(){
		if dataModel.Level[ActualLevel].listofQuestions[iQuestion].checkAnswer(3){
			//dataModel.Level[ActualLevel].listofQuestions.removeAtIndex(iQuestion)
			++iQuestion
			print("Number of question:  \(iQuestion)"  )
			updateLabels()
			unblockbuttons()
		}else{
			button3.enabled = false;
		}
	}
	@IBAction func button4Pressed(){
		if dataModel.Level[ActualLevel].listofQuestions[iQuestion].checkAnswer(4){
			//dataModel.Level[ActualLevel].listofQuestions.removeAtIndex(iQuestion)
			++iQuestion
			print("Number of question:  \(iQuestion)"  )
			updateLabels()
			unblockbuttons()
		}else{
			button4.enabled = false;
		}
	}
	
	
	
	@IBAction func startButtonPressed(sender: UIButton) {
		sender.hidden = true
		button1.hidden = false
		button2.hidden = false
		button3.hidden = false
		button4.hidden = false
		numberofquestionLabel.hidden = false
		questionLabel.hidden = false
		countdownLabel.hidden = false
		Timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("fire:"), userInfo: nil, repeats: true)
		updateLabels()
	}

	
	
	
	
}