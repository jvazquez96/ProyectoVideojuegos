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
		//setValues()
		//updateLabels()
		Timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("fire:"), userInfo: nil, repeats: true)
	}
	func setValues(){
		dataModel.Level[ActualLevel].listofQuestions[0].setTitle("2+2")
		dataModel.Level[ActualLevel].listofQuestions[0].addAnswer("1")
		dataModel.Level[ActualLevel].listofQuestions[0].addAnswer("2")
		dataModel.Level[ActualLevel].listofQuestions[0].addAnswer("3")
		dataModel.Level[ActualLevel].listofQuestions[0].addAnswer("4")
		dataModel.Level[ActualLevel].listofQuestions[0].setIndex(4)
		let question = Questions()
		question.setTitle("3+5")
		question.addAnswer("8")
		question.addAnswer("2")
		question.addAnswer("9")
		question.addAnswer("7")
		question.setIndex(1)
		let question2 = Questions()
		question.setTitle("7+3")
		question.addAnswer("8")
		question.addAnswer("9")
		question.addAnswer("10")
		question.addAnswer("6")
		question.setIndex(3)
		let question3 = Questions()
		question3.setTitle("8+7")
		question3.addAnswer("14")
		question3.addAnswer("15")
		question3.addAnswer("16")
		question3.addAnswer("17")
		question3.setIndex(2)
		let question4 = Questions()
		question4.setTitle("5+9")
		question4.addAnswer("13")
		question4.addAnswer("12")
		question4.addAnswer("16")
		question4.addAnswer("15")
		question4.setIndex(4)
		dataModel.Level[0].listofQuestions.append(question)
		dataModel.Level[0].listofQuestions.append(question2)
		dataModel.Level[0].listofQuestions.append(question3)
		dataModel.Level[0].listofQuestions.append(question4)
	}
	

	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func updateLabels(){
		print("\(iQuestion)")
		//If we have still questions to display
		if (dataModel.Level[ActualLevel].listofQuestions.count > 0){
			numberofquestionLabel.text = ("\(iNumberQuestion)")
			print("\(dataModel.Level[ActualLevel].listofQuestions.count)")
			questionLabel.text = dataModel.Level[ActualLevel].listofQuestions[iQuestion].getQuestion()
			//print("\(dataModel.Level[ActualLevel].listofQuestions[iQuestion].getAnswer(0))")
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
		}else{
			button4.enabled = false;
		}
	}
	
	
	
	
	
}