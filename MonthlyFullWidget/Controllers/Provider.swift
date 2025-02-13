import WidgetKit
import SwiftUI
import AppIntents

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(
            date: Date()
        )
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> DayEntry {
        DayEntry(date: Date())
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<DayEntry> {
        var entries: [DayEntry] = [] // entries are the data.
        // Timeline is just an array of entries.

        // Consisting of 7 entries a day apart starting from the currentDay
        let currentDate = Date()
        for hourOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: hourOffset, to: currentDate)!
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            let entry = DayEntry(
                date: startOfDate
            )
            entries.append(entry)
        }
        
        // At end: whenever timeline ends (every 5 hours)
        // After: a specific date
        // Never: only when a user updates data from within your app.
        return Timeline(entries: entries, policy: .atEnd)
    }
} 