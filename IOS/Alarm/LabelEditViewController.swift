//
//  labelEditViewController.swift
//  Alarm-ios-swift
//
//  Created by longyutao on 15/10/21.
//  Copyright (c) 2015年 LongGames. All rights reserved.
//

import UIKit

class LabelEditViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var labelTextField: UITextView!
    
    var label: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
        self.labelTextField.delegate = self
        
        labelTextField.text = label
        
        // Adding "Save Goals" button to keyboard:
        // https://stackoverflow.com/questions/10077155/how-to-add-done-button-to-the-keyboard
        let ViewForDoneButtonOnKeyboard = UIToolbar()
        ViewForDoneButtonOnKeyboard.sizeToFit()
        let btnDoneOnKeyboard = UIBarButtonItem(title: "Save Goals", style: .done, target: self, action: #selector(self.doneBtnFromKeyboardClicked))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        ViewForDoneButtonOnKeyboard.items = [flexibleSpace, btnDoneOnKeyboard, flexibleSpace]
        labelTextField.inputAccessoryView = ViewForDoneButtonOnKeyboard
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        label = textView.text!
        performSegue(withIdentifier: Id.labelUnwindIdentifier, sender: self)
    }
    
    @IBAction func doneBtnFromKeyboardClicked (sender: Any) {
        self.labelTextField.endEditing(true)
    }
}
