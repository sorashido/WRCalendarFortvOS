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

        let startDateArray:[String] = ["2017-12-18T10:00:00+09:00", "2017-12-19T08:50:00+09:00", "2017-12-20T10:30:00+09:00", "2017-12-21", "2017-12-21T13:30:00+09:00", "2017-12-20T13:30:00+09:00", "2017-12-22", "2017-12-23"]
        let endDateArray: [String] = ["2017-12-18T15:00:00+09:00", "2017-12-19T12:00:00+09:00", "2017-12-20T12:00:00+09:00", "2017-12-27", "2017-12-21T14:30:00+09:00", "2017-12-20T16:00:00+09:00", "2017-12-23", "2017-12-24"]
        let bodyArray: [String] = ["ゼミ", "プログラミング１（１０・１１）", "プログラミング１（１２）", "Symposium at Carlton University", "NICT MTG", "代議員会・教育研究評議会", "段ボール・紙ごみ回収", "天皇誕生日"]
        
        //add events
        weekView.add1DayEvent(start: startDateArray[3], end: endDateArray[3], title: bodyArray[3])
        weekView.add1DayEvent(start: startDateArray[6], end: endDateArray[6], title: bodyArray[6])
        weekView.add1DayEvent(start: startDateArray[7], end: endDateArray[7], title: bodyArray[7])

        for i in 0..<8{
            weekView.addEvent(event: WREvent.make(start: startDateArray[i], end: endDateArray[i], title: bodyArray[i]))
        }
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
