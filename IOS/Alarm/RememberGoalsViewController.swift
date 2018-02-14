//
//  RememberGoalsViewController.swift
//  Alarm-ios-swift
//
//  Created by Jack Swiggett on 2/13/18.
//  Copyright © 2018 LongGames. All rights reserved.
//

import UIKit

@objcMembers
class RememberGoalsViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var goalsTextView: UITextView!
    
    var currentGoal: String?
    var alarm: Alarm?

    override func viewDidLoad() {
        super.viewDidLoad()
        goalsTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
        self.goalsTextView.delegate = self
        
        // Adding "Done" button to keyboard:
        // https://stackoverflow.com/questions/10077155/how-to-add-done-button-to-the-keyboard
        let ViewForDoneButtonOnKeyboard = UIToolbar()
        ViewForDoneButtonOnKeyboard.sizeToFit()
        let btnDoneOnKeyboard = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnFromKeyboardClicked))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        ViewForDoneButtonOnKeyboard.items = [flexibleSpace, btnDoneOnKeyboard, flexibleSpace]
        goalsTextView.inputAccessoryView = ViewForDoneButtonOnKeyboard
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        let storyboard = rootVC!.storyboard!
        let inputGoalsVC = storyboard.instantiateViewController(withIdentifier: "inputGoals") as! InputGoalsViewController
        inputGoalsVC.alarm = self.alarm
        inputGoalsVC.currentGoal = self.currentGoal
        
        let rememberedGoals = self.goalsTextView.text!
        inputGoalsVC.rememberedGoals = rememberedGoals

        self.present(inputGoalsVC, animated: true, completion: nil)
    }
    
    @IBAction func doneBtnFromKeyboardClicked (sender: Any) {
        self.goalsTextView.endEditing(true)
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
