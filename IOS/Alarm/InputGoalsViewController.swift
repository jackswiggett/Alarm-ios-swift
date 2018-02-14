//
//  InputGoalsViewController.swift
//  Alarm-ios-swift
//
//  Created by Jack Swiggett on 2/10/18.
//  Copyright © 2018 LongGames. All rights reserved.
//

import UIKit

@objcMembers
class InputGoalsViewController: UIViewController {
    
    // Properties
    var rememberedGoals: String?
    var currentGoal: String?
    var alarm: Alarm?
    var alarmScheduler: AlarmSchedulerDelegate = Scheduler()

    @IBOutlet weak var goalInput: UITextView!
    @IBOutlet weak var rememberedGoalsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let goal = currentGoal {
            goalInput.text = goal
        }
        if let remembered = rememberedGoals {
            rememberedGoalsView.text = remembered
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmGoals(_ sender: UIButton) {
        self.alarm!.onSnooze = false
        self.alarm!.enabled = false
        alarmScheduler.reSchedule()
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
