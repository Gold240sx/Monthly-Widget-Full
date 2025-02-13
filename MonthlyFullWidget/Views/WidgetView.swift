//
//  WidgetView.swift
//  MonthlyFull
//
//  Created by Michael Martell on 2/13/25.
//

import WidgetKit
import SwiftUI

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
