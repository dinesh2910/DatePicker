//
//  ViewController.swift
//  datePicker
//
//  Created by MacBook Pro on 02.10.16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ui obj
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var coolDatePicker : UIDatePicker!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    // first load func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DatePicker Programmatically
        coolDatePicker = UIDatePicker()
        coolDatePicker.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 200)
        coolDatePicker.addTarget(self, action: #selector(getDateAndTime), for: UIControlEvents.valueChanged)
        
        coolDatePicker.datePickerMode = UIDatePickerMode.date
        coolDatePicker.locale = Locale.current
        coolDatePicker.timeZone = TimeZone.current
        coolDatePicker.date = Date(timeIntervalSince1970: 10)
        coolDatePicker.minimumDate = Date(timeIntervalSince1970: 20)
        coolDatePicker.maximumDate = Date(timeIntervalSinceNow: 0)
        coolDatePicker.countDownDuration = 0
        coolDatePicker.minuteInterval = 5
        
        self.view.addSubview(coolDatePicker)
        
        
        // assigned function to be executed once value did change of myDatePicker
        myDatePicker.addTarget(self, action: #selector(getDateAndTime), for: .valueChanged)
        
        
        self.getDateAndTime()
    }
    

    // called when picker is changed
    func getDateAndTime() {
        
        // declare format of date we wanna see
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        // convert date from datePicker to String type
        let dateString = dateFormatter.string(from: coolDatePicker.date)
        dateLabel.text = "Date: \(dateString)"
        
        
        // declare format of time we wanna see
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm a"
        timeFormatter.amSymbol = "AM"
        timeFormatter.pmSymbol = "PM"
        
        // convert time from timePicker to String type
        let timeString = timeFormatter.string(from: myDatePicker.date)
        timeLabel.text = "Time: \(timeString)"
        
    }
    
    
}
