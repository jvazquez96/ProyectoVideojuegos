//
//  AddQuestionViewController.swift
//  TheGame
//
//  Created by Jorge Vazquez on 4/18/16.
//  Copyright © 2016 Jorge Vazquez. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {

	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var answer1Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
		questionLabel.adjustsFontSizeToFitWidth = true
		answer1Label.adjustsFontSizeToFitWidth = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
