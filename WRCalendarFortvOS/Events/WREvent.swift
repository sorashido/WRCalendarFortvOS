//
//  WREvent.swift
//  Pods
//
//  Created by wayfinder on 2017. 4. 29..
//
//

import UIKit
import DateToolsSwift

open class WREvent: TimePeriod {
    open var title: String = ""
    
    open class func make(date:Date, chunk: TimeChunk, title: String) -> WREvent {
        let event = WREvent(beginning: date, chunk: chunk)
        event.title = title
        
        return event
    }
    
    open class func make(start:String, end:String, title: String) -> WREvent {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let startDate = dateformatter.date(from: start)
        let endDate = dateformatter.date(from: end)
        let event = WREvent(beginning: startDate, end: endDate)
        event.title = title
        
        return event
    }
}
