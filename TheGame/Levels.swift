//
//  Levels.swift
//  TheGame
//
//  Created by Jorge Vazquez on 4/16/16.
//  Copyright © 2016 Jorge Vazquez. All rights reserved.
//

import Foundation

class Levels: NSObject, NSCoding{
	var listofQuestions = [Questions]()
	var iLevel: Int
	init(Level: Int){
		//print("Enters")
		iLevel = 1
		let question = Questions()
		listofQuestions.append(question)
		super.init()
		
	}
	required init?(coder aDecoder: NSCoder){
		//print("Enters")
		listofQuestions = aDecoder.decodeObjectForKey("listOfQuestions") as! [Questions]
//		print("Amount of questions after decoding")
//		print(listofQuestions.count)
		iLevel = aDecoder.decodeIntegerForKey("Level")
	}
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(listofQuestions, forKey: "listOfQuestions")
		aCoder.encodeInteger(iLevel, forKey: "Level")
	}
}