import Foundation
import WidgetKit

struct MockData {
    // Mock data with different months to show different themes
    static let dayOne = MonthlyFullWidgetAttributes.ContentState(date: Date.dateToDisplay(month: 12, day: 18))
    static let dayTwo = MonthlyFullWidgetAttributes.ContentState(date: Date.dateToDisplay(month: 4, day: 19))
    static let dayThree = MonthlyFullWidgetAttributes.ContentState(date: Date.dateToDisplay(month: 6, day: 20))
    static let dayFour = MonthlyFullWidgetAttributes.ContentState(date: Date.dateToDisplay(month: 2, day: 21))
    static let dayFive = MonthlyFullWidgetAttributes.ContentState(date: Date.dateToDisplay(month: 4, day: 22))

	static func dateToDisplay(month: Int, day: Int) -> Date {
		let components = DateComponents(calendar: Calendar.current,
		year: 2022, month: month, day: day)

		return Calendar.current.date(from: components)!
	}
}
