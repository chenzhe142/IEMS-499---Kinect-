//
//  SearchViewController.swift
//  rotateview
//
//  Created by 陈喆 on 15/3/12.
//  Copyright (c) 2015年 Zhe Chen. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var startdate: NSDate!
    var starttime: NSDate!
    var enddate: NSDate!
    var endtime: NSDate!
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    
    @IBOutlet weak var roomNumberTextField: UITextField!
    
    
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var startTimePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    @IBOutlet var endTimePicker: UIDatePicker!
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //startDate Picker Set up
        self.startDatePicker.datePickerMode = UIDatePickerMode.Date
        self.startDatePicker.setDate(NSDate(), animated: true)
        self.startDateTextField.inputView = startDatePicker
        
        self.startTimePicker.datePickerMode = UIDatePickerMode.Time
        self.startTimePicker.setDate(NSDate(), animated: true)
        self.startTimeTextField.inputView = startTimePicker
        
        self.endDatePicker.datePickerMode = UIDatePickerMode.Date
        self.endDatePicker.setDate(NSDate(), animated: true)
        self.endDateTextField.inputView = endDatePicker
        
        self.endTimePicker.datePickerMode = UIDatePickerMode.Time
        self.endTimePicker.setDate(NSDate(), animated: true)
        self.endTimeTextField.inputView = endTimePicker
        
        //Adding a 'Done' Button for startDatePicker
        var doneButtonForStartDate:UIButton = UIButton(frame: CGRectMake(100.0, 100.0, 100.0, 44.0))
        doneButtonForStartDate.setTitle("Done", forState: UIControlState.Normal)
        doneButtonForStartDate.addTarget(self, action: "StartDatePickerSelected", forControlEvents: UIControlEvents.TouchUpInside)
        doneButtonForStartDate.backgroundColor = UIColor.lightGrayColor()
        // Set "Done" button in Date picker
        startDateTextField.inputAccessoryView = doneButtonForStartDate
        
        
        //Adding a 'Done' Button for startTimePicker
        var doneButtonForStartTime:UIButton = UIButton(frame: CGRectMake(100.0, 100.0, 100.0, 44.0))
        doneButtonForStartTime.setTitle("Done", forState: UIControlState.Normal)
        doneButtonForStartTime.addTarget(self, action: "StartTimePickerSelected", forControlEvents: UIControlEvents.TouchUpInside)
        doneButtonForStartTime.backgroundColor = UIColor.lightGrayColor()
        // Set "Done" button in startTime picker
        startTimeTextField.inputAccessoryView = doneButtonForStartTime
        
        
        //Adding a 'Done' Button for EndDatePicker
        var doneButtonForEndDate:UIButton = UIButton(frame: CGRectMake(100.0, 100.0, 100.0, 44.0))
        doneButtonForEndDate.setTitle("Done", forState: UIControlState.Normal)
        doneButtonForEndDate.addTarget(self, action: "EndDatePickerSelected", forControlEvents: UIControlEvents.TouchUpInside)
        doneButtonForEndDate.backgroundColor = UIColor.lightGrayColor()
        // Set "Done" button in EndDate picker
        endDateTextField.inputAccessoryView = doneButtonForEndDate
        
        //Adding a 'Done' Button for endTimePicker
        var doneButtonForEndTime:UIButton = UIButton(frame: CGRectMake(100.0, 100.0, 100.0, 44.0))
        doneButtonForEndTime.setTitle("Done", forState: UIControlState.Normal)
        doneButtonForEndTime.addTarget(self, action: "EndTimePickerSelected", forControlEvents: UIControlEvents.TouchUpInside)
        doneButtonForEndTime.backgroundColor = UIColor.lightGrayColor()
        // Set "Done" button in Time picker
        endTimeTextField.inputAccessoryView = doneButtonForEndTime
    }
    
    func StartDatePickerSelected(){
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        //dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        var locale = NSLocale.currentLocale()
        dateFormatter.locale = locale
        
        // Date shows in our define format in textfield
        // startDate
        self.startDateTextField.text = dateFormatter.stringFromDate(self.startDatePicker.date)
        self.startdate = dateFormatter.dateFromString(dateFormatter.stringFromDate(self.startDatePicker.date))
        
        self.view.endEditing(false)
    }
    
    func StartTimePickerSelected(){
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        //dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        var locale = NSLocale.currentLocale()
        dateFormatter.locale = locale
        
        self.startTimeTextField.text = dateFormatter.stringFromDate(self.startTimePicker.date)
        self.starttime = dateFormatter.dateFromString(dateFormatter.stringFromDate(self.startTimePicker.date))
        
        self.view.endEditing(false)
    }
    
    
    func EndDatePickerSelected(){
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        //dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        var locale = NSLocale.currentLocale()
        dateFormatter.locale = locale
        
        // Date shows in our define format in textfield
        // endDate
        self.endDateTextField.text = dateFormatter.stringFromDate(self.endDatePicker.date)
        self.enddate = dateFormatter.dateFromString(dateFormatter.stringFromDate(self.endDatePicker.date))
        
        self.view.endEditing(false)
    }
    
    func EndTimePickerSelected(){
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        //dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        var locale = NSLocale.currentLocale()
        dateFormatter.locale = locale
        
        self.endTimeTextField.text = dateFormatter.stringFromDate(self.endTimePicker.date)
        self.endtime = dateFormatter.dateFromString(dateFormatter.stringFromDate(self.endTimePicker.date))
        
        self.view.endEditing(false)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Declare a var of manipulate ViewController
        var DestViewController:ViewController = segue.destinationViewController as ViewController
        
        // send the text to ViewController
        // DestViewController.roomNumber = roomNumberTextField.text
        DestViewController.inputRoomNumber = roomNumberTextField.text
        DestViewController.inputStartTime = startDateTextField.text+" "+startTimeTextField.text
        // println(startDateTextField.text+startTimeTextField.text)
        DestViewController.inputEndTime = endDateTextField.text+" "+endTimeTextField.text
        // println(endDateTextField.text+endTimeTextField.text)
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // Dismiss the keyboard
        self.roomNumberTextField.resignFirstResponder()
        self.startDateTextField.resignFirstResponder()
        self.startTimeTextField.resignFirstResponder()
        self.endDateTextField.resignFirstResponder()
        self.endTimeTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
