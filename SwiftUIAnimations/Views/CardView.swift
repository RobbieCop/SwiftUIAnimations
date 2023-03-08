//
//  CardView.swift
//  DesignCodeiOS16
//
//  Created by Rob on 06/03/2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        Grid {
            GridRow {
                card
                card
            }
            GridRow {
                card
                    .gridCellColumns(2)
            }
            GridRow {
                card
                card
            }
        }
        .padding(20)
    }
    
    var card: some View {
        VStack(spacing: 12.0) {
            Image(systemName: "aspectratio")
                .foregroundStyle(.linearGradient(colors: [.white, .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 44, height: 44)
                .background {
                    Hexagon()
                        .stroke()
                        .foregroundStyle(.linearGradient(colors: [.white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                .background {
                    Hexagon()
                        .foregroundStyle(.linearGradient(colors: [.clear, .white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
            
            Text("Up to 8K resolution".uppercased())
                .font(.title3.width(.condensed).bold())
            
            Text("From huge monitors to the phone, your wallpaper will look great anywhere.")
                .font(.footnote)
                .opacity(0.7)
        }
        .frame(maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .padding(.vertical)
        .padding()
        .background(.black)
        .foregroundColor(.white)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .fill(.white.opacity(0.3))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
