//
//  MontlyFullWidgetLiveActivity.swift
//  MontlyFullWidget
//
//  Created by Michael Martell on 9/8/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MontlyFullWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MontlyFullWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MontlyFullWidgetAttributes.self) { context in
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

extension MontlyFullWidgetAttributes {
    fileprivate static var preview: MontlyFullWidgetAttributes {
        MontlyFullWidgetAttributes(name: "World")
    }
}

extension MontlyFullWidgetAttributes.ContentState {
    fileprivate static var smiley: MontlyFullWidgetAttributes.ContentState {
        MontlyFullWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MontlyFullWidgetAttributes.ContentState {
         MontlyFullWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MontlyFullWidgetAttributes.preview) {
   MontlyFullWidgetLiveActivity()
} contentStates: {
    MontlyFullWidgetAttributes.ContentState.smiley
    MontlyFullWidgetAttributes.ContentState.starEyes
}
