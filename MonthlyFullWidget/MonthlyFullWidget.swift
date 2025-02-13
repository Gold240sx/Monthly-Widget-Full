//
//  MonthlyFullWidget.swift
//  MonthlyFullWidget
//
//  Created by Michael Martell on 9/8/24.
//


import WidgetKit
import SwiftUI
import ActivityKit

//AppIntentTimelineProvider (Previously: "Timeline Provider") provides the timeline for the widget.

// A type that provides the widgetKits when to upload the widgets display so it doesn't need to keep querying.


struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
           DayEntry(
               date: Date()
   //          ,configuration: ConfigurationAppIntent() // for displaying multiple variations (like in storybook)
           )
       }
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> DayEntry {
          DayEntry(date: Date()
  //        , configuration: configuration
          )
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
 //              , configuration: configuration
             )
             entries.append(entry)
         }
         
         // At end: whenever timeline ends (every 5 hours)
         // After: a specific date
         // Never: only when a user updates data from within your app.
         return Timeline(entries: entries, policy: .atEnd)
     }

 //    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
 //        // Generate a list containing the contexts this widget is relevant in.
 //    }
 }

struct DayEntry: TimelineEntry {
    let date: Date // always need a date
//    let configuration: ConfigurationAppIntent
}

struct MonthlyFullWidgetEntryView : View {
    var entry: Provider.Entry
    var config: MonthConfig
    
    init(entry: Provider.Entry) {
        self.entry = entry
        self.config = MonthConfig.determineConfig(from: entry.date)
    }
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 4) {
                Spacer()
                Text(config.emojiText)
                    .font(.title2)
                Text(entry.date.weekdayDisplayFormat)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.6)
                    .foregroundColor(config.weekdayTextColor)
                Spacer()
            }
            
            Text(entry.date.dayDisplayFormat)
                .font(.system(size: 70, weight: .bold))
                .foregroundColor(config.dayTextColor)
        }
        .padding(.vertical, 8)
        .containerBackground(config.backgroundColor.gradient, for: .widget)
    }
}

struct MonthlyFullWidget: Widget {
    let kind: String = "MonthlyFullWidget"

    var body: some WidgetConfiguration {
        // Static configuration is the easiest (allows simple setup (StaticConfiguration(kind: kind, provider: Provider()){ entry in MontlyFullWidgetEntryView(entry: endry)
        
        //  displayName and Subscription is what it shows in the widget settings
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


extension ConfigurationAppIntent {
    // SHow multiple Views of the same thing with different contend
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
}

extension Date {
    static func dateToDisplay(month: Int, day: Int) -> Date {
        let components = DateComponents(calendar: Calendar.current, year: 2022, month: month, day: day)
        return Calendar.current.date(from: components) ?? Date()
    }

}

#Preview(as: .systemSmall) {
    MonthlyFullWidget()
} timeline: {
    DayEntry(date: .now)
    DayEntry(date: Date.dateToDisplay(month: 12, day: 22))
}


extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}

struct MonthlyFullWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Add your live activity state properties here
    }
}

struct MonthlyFullWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MonthlyFullWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Live Activity")
            }
        } dynamicIsland: { context in
            // Dynamic Island UI goes here
            DynamicIsland {
                // Expanded UI
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("Center")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
        }
    }
}
