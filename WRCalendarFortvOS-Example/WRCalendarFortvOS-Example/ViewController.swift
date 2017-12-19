//
//  ViewController.swift
//  WRCalendarFortvOS-Example
//
//  Created by Daichi Shibata on 2017/12/17.
//  Copyright © 2017 daichi. All rights reserved.
//

import UIKit
import WRCalendarFortvOS

class MainCont: UIViewController {

    @IBOutlet weak var weekView: WRWeekView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCalendarData()
        
        //add events
        weekView.addEvent(event: WREvent.make(date: Date(), chunk: 2.hours, title: "#1"))
        weekView.addEvent(event: WREvent.make(date: Date(), chunk: 1.hours, title: "#2"))
        weekView.addEvent(event: WREvent.make(date: Date().add(90.minutes), chunk: 1.hours, title: "#3"))
        weekView.addEvent(event: WREvent.make(date: Date().add(110.minutes), chunk: 1.hours, title: "#4"))

        weekView.addEvent(event: WREvent.make(date: Date().add(1.days), chunk: 1.hours, title: "tomorrow"))
        weekView.addEvent(event: WREvent.make(date: Date().add(1.days), chunk: 1.hours, title: "tomorrow"))
        
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFromFmt2 = fmt.date(from: "2017-12-20 7:00:00")
        weekView.addEvent(event: WREvent.make(date: dateFromFmt2!, chunk: 1.hours, title: "tomorrow"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupCalendarData() {
        weekView.setCalendarDate(Date())
        weekView.delegate = self
    }
}

extension MainCont: WRWeekViewDelegate {
    func view(startDate: Date, interval: Int) {
        print(startDate, interval)
    }
    
    func selectEvent(_ event: WREvent) {
        print(event.title)
    }
}
