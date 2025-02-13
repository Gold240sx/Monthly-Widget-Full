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
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
    }
}

#Preview(as: .systemSmall) {
    MonthlyFullWidget()
} timeline: {
    DayEntry(date: .now)
    DayEntry(date: Date.dateToDisplay(month: 4, day: 18))
}
