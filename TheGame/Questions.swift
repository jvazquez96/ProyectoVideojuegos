//
//  Questions.swift
//  TheGame
//
//  Created by Jorge Vazquez on 4/16/16.
//  Copyright © 2016 Jorge Vazquez. All rights reserved.
//

import Foundation

class Questions: NSObject, NSCoding{
	var Question: String
	var Answers: [String]
	var iAnswer: Int
	override init(){
		//print("Questions")
		Question = "Placeholder question"
		Answers = ["1","2","3","4"]
		iAnswer = 1
		super.init()
	}
	required init?(coder aDecoder: NSCoder){
		Question = aDecoder.decodeObjectForKey("Question") as! String
		Answers = aDecoder.decodeObjectForKey("Answers") as! [String]
		iAnswer = 1
		//iAnswer = aDecoder.decodeObjectForKey("iAnswer") as! Int
	}
	func setTitle(sQuestion: String){
		Question = sQuestion
	}
	func setAnswer(sAnswer: String, iIndex: Int){
		Answers[iIndex] = sAnswer
	}
	func getQuestion()->String{
		return Question
	}
	func getAnswer(iIndex: Int)->String{
		return Answers[iIndex]
	}
	func checkAnswer(iIndex: Int)->Bool{
		if iIndex == iAnswer{
			return true
		}else{
			return false
		}
	}
	func setIndex(iIndex: Int){
		iAnswer = iIndex
	}
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(Question, forKey: "Question")
		aCoder.encodeObject(Answers, forKey: "Answers")
		//aCoder.encodeObject(iAnswer, forKey: "iAnswer")
	}
	
	


}
