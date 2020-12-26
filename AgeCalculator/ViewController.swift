//
//  ViewController.swift
//  AgeCalculator
//
//  Created by shubham Garg on 05/06/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//IBOutlet
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var dobTextField: UITextField!
    var datePicker: UIDatePicker?
    var toolBar: UIToolbar = UIToolbar()
    var dateOfBirth:Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Age Calculator"
        self.doDatePicker()
    }
    
    func doDatePicker(){
        // DatePicker
        // cerate datepicker object with some frame
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        // set mode of date
        self.datePicker?.datePickerMode = UIDatePicker.Mode.date
        //Max date
        datePicker?.maximumDate = Date()
        // set datepicker to textfield Input view
        dobTextField.inputView = datePicker

        // ToolBar
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()

        // Adding Button ToolBar
        // create done button
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        // space between button
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        // cancel button
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        // add above buttons
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        // set toolbar as textfield input accessory
        dobTextField.inputAccessoryView = toolBar


    }


    @objc func doneClick() {
        //Creating an object of date formater
        let dateFormatter = DateFormatter()
        // seting style of date
        dateFormatter.dateStyle = .medium
        // getting date object from picker
        dateOfBirth = datePicker?.date
        dobTextField.text = dateFormatter.string(from: dateOfBirth!)
        // close datepicker
        self.view.endEditing(true)


    }

    @objc func cancelClick() {
        // close date picker
        self.view.endEditing(true)
    }
//IBAction
    @IBAction func calculateAgeBtnAxn(_ sender: Any) {
        // Check if there will be date of birth
        if let dob = dateOfBirth{
            // Today Date
            let today = Date()
            // Calender refrence
            let calendar = Calendar.current
            // Calculate age from calender
            // take date component
            let components = calendar.dateComponents([.year, .month, .day], from: dob, to: today)
            let ageInYear = components.year ?? 0
            let ageInMonth = components.month ?? 0
            let ageInDays = components.day ?? 0
            ageLabel.text = "\(ageInYear)years \(ageInMonth)months \(ageInDays)days"
        }
    }
}

