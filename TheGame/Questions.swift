//
//  Questions.swift
//  TheGame
//
//  Created by Jorge Vazquez on 4/16/16.
//  Copyright © 2016 Jorge Vazquez. All rights reserved.
//

import Foundation

class Questions{
	var Question: String!
	var Answers: [String]!
//	init(sQuestion: String, sAnswers: [String]){
//		Question = sQuestion
//		Answers = sAnswers
//	}
	init(){
	Question = "Placeholder question"
	Answers = ["1","2","3","4"]
	}
	func getAnswer(iIndex: Int)->String{
		return Answers[iIndex]
	}


}
