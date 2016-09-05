//
//  EditViewController.swift
//  RealmExample
//
//  Created by algo on 5/17/16.
//  Copyright © 2016 algostudio. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var fieldName: UITextField!
    @IBOutlet var fieldAddress: UITextField!
    
    var name = ""
    var address = ""
    
    var Time = 10
    
    
 //   NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
    
    
    override func viewDidLoad() {
        
        var Timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("Notification"), userInfo: nil, repeats: true)
        
        fieldName.text = name
      fieldAddress.text = address
     
    }
    
    func Notification(){
        
        Time -= 1
        
        if(Time == 0){
        
        
    var Notification = UILocalNotification()
        
        Notification.alertAction = "Go Back to App"
        Notification.alertBody = "Build your fortress"
        Notification.fireDate = NSDate(timeIntervalSinceNow: 0)
        
        UIApplication.sharedApplication().scheduleLocalNotification(Notification)
        }
       
    
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
        
        
        guard let txtName = fieldName.text where !txtName.isEmpty else {
            
            var AlertView = UIAlertController(title: "Please Enter Task", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            
            AlertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(AlertView, animated: true, completion: nil)
            
            
            return
        }
        
        guard let txtAddress = fieldAddress.text where txtAddress.isEmpty else {
            return
        }
        
        let model = ClassModel()
        model.address = fieldAddress.text!
        model.name = fieldName.text!
        
        
        
        DbHelper.update(model)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        navigationController?.popToRootViewControllerAnimated(true)
        
        
        var AlertView = UIAlertController(title: "Task Saved", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        AlertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(AlertView, animated: true, completion: nil)
        
        
        
    }
    
    
    
    @IBAction func textFieldEditing(sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(EditViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
    }

    
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        
        fieldAddress.text = dateFormatter.stringFromDate(sender.date)
        
    }
}
