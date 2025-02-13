//
//  MonthlyFullWidget.swift
//  MonthlyFullWidget
//
//  Created by Michael Martell on 9/8/24.
//

import WidgetKit
import SwiftUI
import ActivityKit

struct MonthlyFullWidget: Widget {
    let kind: String = "MonthlyFullWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: ConfigurationAppIntent.self,
            provider: Provider()
        ){ entry in
            MonthlyFullWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Monthly Style Widget")
        .description("The theme of the widget changes based on the month.")
        .supportedFamilies([.systemSmall])
        // if you only want it to show lockscreen or homescreen use the following:
        // .disfavoredLocations([.lockScreen / .standby], for: [.systemSmall])
    }
}

#Preview("Monthly Widget", as: .systemSmall) {
    MonthlyFullWidget()
} timeline: {
    DayEntry(date: MockData.dayOne.date)
    DayEntry(date: MockData.dayTwo.date)
    DayEntry(date: MockData.dayThree.date)
    DayEntry(date: MockData.dayFour.date)
    DayEntry(date: MockData.dayFive.date)
}
