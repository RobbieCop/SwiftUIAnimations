//
//  DetailView.swift
//  DesignCodeiOS16
//
//  Created by Rob on 06/03/2023.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            Text("12 Transactions".uppercased())
                .font(.subheadline.weight(.medium))
                .foregroundColor(.secondary)
                .padding(.top, 20)
            
            Text("Entertainment")
                .font(.largeTitle.width(.expanded))
            ViewThatFits {
                HStack(alignment: .top, spacing: 20.0) {
                    VStack {
                        ChartsView()
                        GridView()
                    }
                    VStack {
                        CardView()
                        GridView()
                    }
                        .frame(width: 400)
                }
                VStack {
                    ChartsView()
                    CardView()
                    GridView()
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
