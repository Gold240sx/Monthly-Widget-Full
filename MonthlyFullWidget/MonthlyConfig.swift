//
//  MonthConfig.swift
//  MonthlyFullWidgetExtension
//
//  Created by Michael Martell on 9/8/24.
//

import Foundation
import SwiftUI


struct MonthConfig {
    let backgroundColor: Color
    let emojiText: String
    let weekdayTextColor: Color
    let dayTextColor: Color


    static func determineConfig(from date: Date) -> MonthConfig {
        let monthInt = Calendar.current.component(.month, from: date)


        switch monthInt {
        case 1: // Nisan (April / MArch)
            return MonthConfig(backgroundColor: .gray,
                               emojiText: "⛄️",
                               weekdayTextColor: .black.opacity(0.6),
                               dayTextColor: .white.opacity(0.8))
        case 2: //Iyar (March / February)
            return MonthConfig(backgroundColor: .palePink,
                               emojiText: "❤️",
                               weekdayTextColor: .black.opacity(0.5),
                               dayTextColor: .pink.opacity(0.8))
        case 3: //Sivan (June / May )
            return MonthConfig(backgroundColor: .paleGreen,
                               emojiText: "☘️",
                               weekdayTextColor: .black.opacity(0.7),
                               dayTextColor: .darkGreen.opacity(0.8))
        case 4: // Tammuz (July / June)
            return MonthConfig(backgroundColor: .paleBlue,
                               emojiText: "☔️",
                               weekdayTextColor: .black.opacity(0.5),
                               dayTextColor: .purple.opacity(0.8))
        case 5: // Av (August / July )
            return MonthConfig(backgroundColor: .paleYellow,
                               emojiText: "🌺",
                               weekdayTextColor: .black.opacity(0.5),
                               dayTextColor: .pink.opacity(0.7))
        case 6: // Elul (Sep / Aug )
            return MonthConfig(backgroundColor: .skyBlue,
                               emojiText: "🌤",
                               weekdayTextColor: .black.opacity(0.5),
                               dayTextColor: .paleYellow.opacity(0.8))
        case 7: // Tishrei ( Oct / Sep )
            return MonthConfig(backgroundColor: .blue,
                               emojiText: "🏖",
                               weekdayTextColor: .black.opacity(0.5),
                               dayTextColor: .paleBlue.opacity(0.8))
        case 8: // Heshvan (November / October )
            return MonthConfig(backgroundColor: .paleOrange,
                               emojiText: "☀️",
                               weekdayTextColor: .black.opacity(0.5),
                               dayTextColor: .darkOrange.opacity(0.8))
        case 9: // Kislev (December / November)
            return MonthConfig(backgroundColor: .paleRed,
                               emojiText: "🍁",
                               weekdayTextColor: .black.opacity(0.5),
                               dayTextColor: .paleYellow.opacity(0.9))
        case 10: // Tevet (January / December )
            return MonthConfig(backgroundColor: .black,
                               emojiText: "👻",
                               weekdayTextColor: .white.opacity(0.6),
                               dayTextColor: .orange.opacity(0.8))
        case 11: // Shevat ( February / January )
            return MonthConfig(backgroundColor: .paleBrown,
                               emojiText: "🦃",
                               weekdayTextColor: .black.opacity(0.6),
                               dayTextColor: .black.opacity(0.6))
        case 12: // Adar ( March / February )
            return MonthConfig(backgroundColor: .paleRed,
                               emojiText: "🎄",
                               weekdayTextColor: .white.opacity(0.9),
                               dayTextColor: .darkGreen.opacity(0.7))
        default: // Nothing
            return MonthConfig(backgroundColor: .gray,
                               emojiText: "📅",
                               weekdayTextColor: .black.opacity(0.6),
                               dayTextColor: .white.opacity(0.8))
        }
    }
}
