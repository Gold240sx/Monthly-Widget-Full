//
//  MonthlyFullWidgetLiveActivity.swift
//  MonthlyFullWidget
//
//  Created by Michael Martell on 2/13/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MonthlyFullWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MonthlyFullWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MonthlyFullWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MonthlyFullWidgetAttributes {
    fileprivate static var preview: MonthlyFullWidgetAttributes {
        MonthlyFullWidgetAttributes(name: "World")
    }
}

extension MonthlyFullWidgetAttributes.ContentState {
    fileprivate static var smiley: MonthlyFullWidgetAttributes.ContentState {
        MonthlyFullWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MonthlyFullWidgetAttributes.ContentState {
         MonthlyFullWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MonthlyFullWidgetAttributes.preview) {
   MonthlyFullWidgetLiveActivity()
} contentStates: {
    MonthlyFullWidgetAttributes.ContentState.smiley
    MonthlyFullWidgetAttributes.ContentState.starEyes
}
