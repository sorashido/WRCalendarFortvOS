//
//  ViewController.swift
//  WRCalendarFortvOS-Example
//
//  Created by Daichi Shibata on 2017/12/17.
//  Copyright © 2017 daichi. All rights reserved.
//

import UIKit
import WRCalendarFortvOS
import SwiftyJSON

var calendarDate: JSON = JSON.init()

class MainCont: UIViewController {

    @IBOutlet weak var weekView: WRWeekView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCalendarData()

        let startDateArray:[String] = ["2018-1-31T10:00:00+09:00", "2018-1-31T08:50:00+09:00", "2018-1-31T10:30:00+09:00", "2018-2-1", "2018-2-1T13:30:00+09:00", "2018-2-1T13:30:00+09:00", "2018-2-1", "2018-2-1"]
        let endDateArray: [String] = ["2018-1-31T15:00:00+09:00", "2018-1-31T12:00:00+09:00", "2018-1-31T12:00:00+09:00", "2018-2-1", "2018-2-1T14:30:00+09:00", "2018-2-1T16:00:00+09:00", "2018-2-1", "2018-2-1"]
        let bodyArray: [String] = ["xx", "yyy", "zzz", "ttt", "mmm", "sample", "sample2", "天皇誕生日"]
        let organizerArray: [String] = ["a", "a", "b", "c", "c", "c", "d", "d", "e"]
                weekView.add1DayEvent(start: startDateArray[3], end: endDateArray[3], title: bodyArray[3], color: getColorFromCalendarName(name: organizerArray[3]))
                weekView.add1DayEvent(start: startDateArray[6], end: endDateArray[6], title: bodyArray[6], color: getColorFromCalendarName(name: organizerArray[6]))
                weekView.add1DayEvent(start: startDateArray[7], end: endDateArray[7], title: bodyArray[7], color: getColorFromCalendarName(name: organizerArray[7]))
        
                for i in 0..<8{
                    weekView.addEvent(event: WREvent.make(start: startDateArray[i], end: endDateArray[i], title: bodyArray[i], color: getColorFromCalendarName(name: organizerArray[i])))
                }
//        let jsonData = NSData(contentsOfFile: "output.json")
//        calendarDate = JSON(jsonData)
//
//        //add events
//        calendarDate.forEach{( _, data) in
//            if data["start"]["date"].stringValue.isEmpty {
//                self.weekView.addEvent(event: WREvent.make(start: data["start"]["dateTime"].stringValue, end: data["end"]["dateTime"].stringValue, title: data["summary"].stringValue, color: getColorFromCalendarName(name: data["organizer"]["displayName"].stringValue)))
//            } else {
//                self.weekView.add1DayEvent(start: data["start"]["date"].stringValue, end: data["end"]["date"].stringValue, title: data["summary"].stringValue, color: getColorFromCalendarName(name: data["organizer"]["displayName"].stringValue))
//                    calendarDate = []
//                print("updatecalendr")
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupCalendarData() {
        weekView.setUIParams(hourHeight: 60, rowHeaderWidth: 60, columnHeaderHeight: 50, sectionWidth: 10, hourGridDivisionValue: .minutes_30)
        weekView.setMargin(margin: UIEdgeInsets(top: -400, left: 0, bottom: 0, right: 0))
        print(Date())
        weekView.setCalendarDate(Date())
        weekView.delegate = self
    }
    
    func getColorFromCalendarName(name: String) ->UIColor {
        let dict = ["伊藤研究室共用": UIColor(hex: "E40008").withAlphaComponent(0.4),
                    "伊藤先生（会議予定）": UIColor(hex: "00AC32").withAlphaComponent(0.4),
                    "伊藤孝行研究室": UIColor(hex: "A546AF").withAlphaComponent(0.4),
                    "伊藤研就活カレンダー": UIColor(hex: "D77521").withAlphaComponent(0.4),
                    "伊藤研究室会議室情報": UIColor(hex: "0085C2").withAlphaComponent(0.4),
                    "会議情報": UIColor(hex: "FFBD44").withAlphaComponent(0.4),
                    "新人研修2018": UIColor(hex: "A069A8").withAlphaComponent(0.4),
                    "Takayuki Ito": UIColor(hex: "7CB341").withAlphaComponent(0.4),
                    "日本の祝日": UIColor(hex: "F27B74").withAlphaComponent(0.4)]
        
        if let color = dict[name]{
            return color
        }else{
            return UIColor.blue.withAlphaComponent(0.3)
        }
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

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        if hex.count == 6 {
            let rawValue: Int = Int(hex, radix: 16) ?? 0
            let B255: Int = rawValue % 256
            let G255: Int = ((rawValue - B255) / 256) % 256
            let R255: Int = ((rawValue - B255) / 256 - G255) / 256
            
            self.init(red: CGFloat(R255) / 255, green: CGFloat(G255) / 255, blue: CGFloat(B255) / 255, alpha: alpha)
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
        }
    }
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
