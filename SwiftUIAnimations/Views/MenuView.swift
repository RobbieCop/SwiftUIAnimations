//
//  MenuView.swift
//  DesignCodeiOS16
//
//  Created by Rob on 02/03/2023.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List(navigationItems) { item in
                Button {
                    dismiss()
                    selectedMenu = item.menu
                } label: {
                    Label(item.title, systemImage: item.icon)
                        .foregroundColor(.primary)
                    .padding(8)
                }
            }
            .listStyle(.plain)
        }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
