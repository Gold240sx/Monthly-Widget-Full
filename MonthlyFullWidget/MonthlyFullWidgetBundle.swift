//
//  MonthlyFullWidgetBundle.swift
//  MonthlyFullWidget
//
//  Created by Michael Martell on 2/13/25.
//

import WidgetKit
import SwiftUI

@main
struct MonthlyFullWidgetBundle: WidgetBundle {
    var body: some Widget {
        MonthlyFullWidget()
        MonthlyFullWidgetControl()
        MonthlyFullWidgetLiveActivity()
    }
}
