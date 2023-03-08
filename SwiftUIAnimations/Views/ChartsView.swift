//
//  ChartsView.swift
//  DesignCodeiOS16
//
//  Created by Rob on 06/03/2023.
//

import SwiftUI
import Charts

struct ChartsView: View {
    var body: some View {
        Chart {
            ForEach(data) { item in
                LineMark(x: .value("Day", item.day), y: .value("Value", item.value),
                         series: .value("Year", "2023"))
                    .interpolationMethod(.catmullRom)
                            .symbol(by: .value("Year", "2023"))
                            .foregroundStyle(by: .value("Year", "2023"))
            }
            ForEach(data2) { item in
                LineMark(x: .value("Day", item.day), y: .value("Value", item.value),
                         series: .value("Year", "2022"))
                    .interpolationMethod(.catmullRom)
                    .symbol(by: .value("Year", "2022"))
                    .foregroundStyle(by: .value("Year", "2022"))
            }
        }
        .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
        .frame(height: 300)
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}

struct Value: Identifiable {
    var id = UUID()
    var day: String
    var value: Double
}

let data = [
    Value(day: "Jun 1", value: 200),
    Value(day: "Jun 2", value: 96),
    Value(day: "Jun 3", value: 312),
    Value(day: "Jun 4", value: 256),
    Value(day: "Jun 5", value: 505),
]

let data2 = [
    Value(day: "Jun 1", value: 151),
    Value(day: "Jun 2", value: 192),
    Value(day: "Jun 3", value: 176),
    Value(day: "Jun 4", value: 158),
    Value(day: "Jun 5", value: 401),
]
