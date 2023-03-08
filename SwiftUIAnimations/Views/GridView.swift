//
//  GridView.swift
//  DesignCodeiOS16
//
//  Created by Rob on 06/03/2023.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid {
            Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                GridRow {
                    Text("Votes")
                        .gridColumnAlignment(.trailing)
                        .gridCellColumns(2)
                    Text("Rating")
                }
                .foregroundColor(.secondary)
                .font(.footnote)
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
                GridRow {
                    Text("4")
                    ProgressView(value: 0.1)
                        .frame(maxWidth: 250)
                    RatingView(rating: 1)
                }
                GridRow {
                    Text("12")
                    ProgressView(value: 0.2)
                        .frame(maxWidth: 250)
                    RatingView(rating: 2)
                }
                GridRow {
                    Text("21")
                    ProgressView(value: 0.4)
                        .frame(maxWidth: 250)
                    RatingView(rating: 3)
                }
                GridRow {
                    Text("25")
                    ProgressView(value: 0.5)
                        .frame(maxWidth: 250)
                    RatingView(rating: 4)
                }
                GridRow {
                    Text("12")
                    ProgressView(value: 0.3)
                        .frame(maxWidth: 250)
                    RatingView(rating: 5)
                }
            }
            .padding(20)

        }
    }
}

struct RatingView: View {
    var rating: Int
    let list = [1, 2, 3, 4, 5]
    var body: some View {
        HStack(spacing: 0.0) {
            ForEach(list, id: \.self) { item in
                Image(systemName: rating >= item ? "star.fill" : "star")
            }
        }
    }
    
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
