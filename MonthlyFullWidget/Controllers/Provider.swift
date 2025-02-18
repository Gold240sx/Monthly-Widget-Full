import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(
            date: Date(),
            showFunFont: false
        )
    }
    
    func snapshot(for configuration: ChangeFontIntent, in context: Context) async -> DayEntry {
        let entry = DayEntry(date: Date(), showFunFont: false)
        return entry
    }
    
    func timeline(for configuration: ChangeFontIntent, in context: Context) async -> Timeline<DayEntry> {
        var entries: [DayEntry] = [] // entries are the data.
        // Timeline is just an array of entries.
        
        let showFunFont = configuration.funFont

        // Consisting of 7 entries a day apart starting from the currentDay
        let currentDate = Date()
        for hourOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: hourOffset, to: currentDate)!
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            let entry = DayEntry(
                date: startOfDate,
                showFunFont: showFunFont!
            )
            entries.append(entry)
        }
        
        // At end: whenever timeline ends (every 5 hours)
        // After: a specific date
        // Never: only when a user updates data from within your app.
        let timeline = Timeline(entries: entries, policy: .atEnd)
        return timeline
    }
    
//    func getTimeline(for configuration: ChangeFontIntent, in context: Context, completion: @escaping (Timeline<DayEntry>) -> Void) {
//
//    }
    
//    func getSnapshot(for configuration: ChangeFontIntent, in context: Context, completion: @escaping (DayEntry) -> Void) {
//   
//    }
} 
