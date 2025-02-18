//
//  WidgetView.swift
//  MonthlyFull
//
//  Created by Michael Martell on 2/13/25.
//

import WidgetKit
import SwiftUI

struct MonthlyFullWidgetEntryView : View {
    @Environment(\.showsWidgetContainerBackground) var showsBackground
    @Environment(\.widgetRenderingMode) var renderingMode // changes to UI if nightmode doesn't look quite right.
    var entry: Provider.Entry
    var config: MonthlyConfig
    let funFontName = "Chalkduster"
    
    init(entry: Provider.Entry) {
        self.entry = entry
        self.config = MonthlyConfig.determineConfig(from: entry.date)
    }
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 4) {
                Spacer()
                Text(config.emojiText)
                    .font(.title2)
                    // Begin accent color emoji override
                    .widgetAccentable()
                    // End accent color emoji override
                Text(entry.date.weekdayDisplayFormat)
                    .font(entry.showFunFont ? .custom(funFontName, size: 24) : .title3)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.6)
                    .foregroundStyle(showsBackground ? config.weekdayTextColor : .white)
                Spacer()
            }
            .id(entry.date)
            // Transition animations
            .transition(.push(from: .trailing))
            .animation(.bouncy, value: entry.date)
            
            Text(entry.date.dayDisplayFormat)
                .font(entry.showFunFont ? .custom(funFontName, size: 80) : .system(size: 70, weight: .bold))
                .foregroundStyle(showsBackground ? config.dayTextColor : .white)
                .contentTransition(.numericText())
                .widgetAccentable()
        }
        .padding(.vertical, 8)
        .containerBackground(config.backgroundColor.gradient, for: .widget)
    }
}
