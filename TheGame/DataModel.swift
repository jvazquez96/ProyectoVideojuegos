//
//  DataModel.swift
//  TheGame
//
//  Created by Jorge Vazquez on 4/17/16.
//  Copyright © 2016 Jorge Vazquez. All rights reserved.
//

import Foundation

class DataModel{
	var Level = [Levels]()
	init(){
		//print("\(dataFilePath())")
		loadLevels()
		//registerDefaults()
		//firsttime()
		//check()
	}
	func firsttime(){
//		let userDefaults = NSUserDefaults.standardUserDefaults()
//		let firstTime = userDefaults.boolForKey("FirstTime")
//		if firstTime{
			print("FirstTime")
			let initiallevel = Levels(Level: 1)
			Level.append(initiallevel)
//			userDefaults.setBool(false, forKey: "FirstTime")
//			userDefaults.synchronize()
		//}
	}
	func check(){
		print("Amount of Levels")
		print("\(Level.count)")
	}
	
	func documentsDirectory()->String{
		let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
		return paths[0]
	}
	
	func dataFilePath() -> String{
		return (documentsDirectory() as NSString!).stringByAppendingPathComponent("Levels.plist")
	}
	
	func saveLevels(){
		let data = NSMutableData()
		let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
		archiver.encodeObject(Level, forKey: "Levels")
		archiver.finishEncoding()
		data.writeToFile(dataFilePath(), atomically: true)
	}
	func loadLevels(){
		let path = dataFilePath()
		if NSFileManager.defaultManager().fileExistsAtPath(path){
			if let data = NSData(contentsOfFile: path){
				print("Data exist")
				let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
				Level = unarchiver.decodeObjectForKey("Levels") as! [Levels]
				unarchiver.finishDecoding()
			}
		}
  }

}