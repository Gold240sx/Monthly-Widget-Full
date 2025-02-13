//
//  DayEntry.swift
//  MonthlyFull
//
//  Created by Michael Martell on 2/13/25.
//


import WidgetKit

struct DayEntry: TimelineEntry {
    let date: Date // always need a date
//    let configuration: ConfigurationAppIntent
}


extension Date {
    static func dateToDisplay(month: Int, day: Int) -> Date {
        let components = DateComponents(calendar: Calendar.current, year: 2022, month: month, day: day)
        return Calendar.current.date(from: components) ?? Date()
    }

}

extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}
