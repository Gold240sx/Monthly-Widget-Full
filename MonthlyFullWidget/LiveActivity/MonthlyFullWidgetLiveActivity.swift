//
//  MonthlyFullWidgetLiveActivity.swift
//  MonthlyFullWidget
//
//  Created by Michael Martell on 9/8/24.
//

import ActivityKit
import WidgetKit
import SwiftUI
import Foundation

struct MonthlyFullWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var date: Date
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MonthlyFullWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MonthlyFullWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            let entry = DayEntry(date: context.state.date)
            let config = MonthlyConfig.determineConfig(from: context.state.date)
            
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
            .background(config.backgroundColor) // have to use background instead of containerBackground
            .activityBackgroundTint(Color.clear)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here
                DynamicIslandExpandedRegion(.leading) {
                    let entry = DayEntry(date: context.state.date)
                    let config = MonthlyConfig.determineConfig(from: context.state.date)
                    
                    VStack(spacing: 12) {
                        HStack(spacing: 4) {
                            Text(config.emojiText)
                                .font(.title2)
                            Text(entry.date.weekdayDisplayFormat)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .minimumScaleFactor(0.6)
                                .foregroundColor(config.weekdayTextColor)
                        }
                        Text(entry.date.dayDisplayFormat)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(config.dayTextColor)
                    }
                    .padding(.vertical, 4)
                    .background(config.backgroundColor)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    let entry = DayEntry(date: context.state.date)
                    let config = MonthlyConfig.determineConfig(from: context.state.date)
                    Text(entry.date.dayDisplayFormat)
                        .foregroundColor(config.dayTextColor)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    let entry = DayEntry(date: context.state.date)
                    let config = MonthlyConfig.determineConfig(from: context.state.date)
                    Text(entry.date.weekdayDisplayFormat)
                        .foregroundColor(config.weekdayTextColor)
                }
            } compactLeading: {
                Text(context.state.date.dayDisplayFormat)
            } compactTrailing: {
                Text(context.state.date.weekdayDisplayFormat)
            } minimal: {
                Text(context.state.date.dayDisplayFormat)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MonthlyFullWidgetAttributes {
    fileprivate static var preview: MonthlyFullWidgetAttributes {
        MonthlyFullWidgetAttributes(name: "Monthly Widget")
    }
}

extension MonthlyFullWidgetAttributes.ContentState {
    fileprivate static var currentMonth: MonthlyFullWidgetAttributes.ContentState {
        MonthlyFullWidgetAttributes.ContentState(date: .now)
    }
    
    fileprivate static var april: MonthlyFullWidgetAttributes.ContentState {
        MonthlyFullWidgetAttributes.ContentState(
            date: Date.dateToDisplay(month: 4, day: 18)
        )
    }
}

#Preview("Notification", as: .content, using: MonthlyFullWidgetAttributes.preview) {
   MonthlyFullWidgetLiveActivity()
} contentStates: {
    MockData.dayOne
    MockData.dayTwo
    MockData.dayThree
    MockData.dayFour
    MockData.dayFive
}

#Preview("Live Activity", as: .content, using: MonthlyFullWidgetAttributes.preview) {
   MonthlyFullWidgetLiveActivity()
} contentStates: {
    MockData.dayOne
    MockData.dayTwo
    MockData.dayThree
    MockData.dayFour
    MockData.dayFive
}

#Preview("Lock Screen", as: .content, using: MonthlyFullWidgetAttributes.preview) {
   MonthlyFullWidgetLiveActivity()
} contentStates: {
    MockData.dayOne
    MockData.dayTwo
    MockData.dayThree
    MockData.dayFour
    MockData.dayFive
}

#Preview("Dynamic Island Compact", as: .dynamicIsland(.compact), using: MonthlyFullWidgetAttributes.preview) {
   MonthlyFullWidgetLiveActivity()
} contentStates: {
    MockData.dayOne
}

#Preview("Dynamic Island Expanded", as: .dynamicIsland(.expanded), using: MonthlyFullWidgetAttributes.preview) {
   MonthlyFullWidgetLiveActivity()
} contentStates: {
    MockData.dayOne
}

#Preview("Dynamic Island Minimal", as: .dynamicIsland(.minimal), using: MonthlyFullWidgetAttributes.preview) {
   MonthlyFullWidgetLiveActivity()
} contentStates: {
    MockData.dayOne
}
