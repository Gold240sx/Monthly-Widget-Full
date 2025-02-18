//
//  MonthlyFullWidget.swift
//  MonthlyFullWidget
//
//  Created by Michael Martell on 9/8/24.
//

import WidgetKit
import SwiftUI
import ActivityKit
import AppIntents

struct MonthlyFullWidget: Widget {
    let kind: String = "MonthlyFullWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ChangeFontIntent.self, provider: Provider()){ entry in
            MonthlyFullWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Monthly Style Widget")
        .description("The theme of the widget changes based on the month.")
        .supportedFamilies([.systemSmall])
        // if you only want it to show lockscreen or homescreen use the following:
        // .disfavoredLocations([.lockScreen / .standby], for: [.systemSmall])
    }
}

struct ChangeFontIntent: AppIntent, WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Fun Font"
    static var description: IntentDescription = .init(stringLiteral: "Switch to a fun font")
    
    @Parameter(title: "Fun Font", default: false)
    var funFont: Bool?
}

#Preview("Monthly Widget", as: .systemSmall) {
    MonthlyFullWidget()
} timeline: {
    DayEntry(date: MockData.dayOne.date, showFunFont: false)
    DayEntry(date: MockData.dayTwo.date, showFunFont: true)
    DayEntry(date: MockData.dayThree.date, showFunFont: false)
    DayEntry(date: MockData.dayFour.date, showFunFont: true)
    DayEntry(date: MockData.dayFive.date, showFunFont: false)
}
