//
//  CardReflectionView.swift
//  DesignCodeiOS16
//
//  Created by Rob on 07/03/2023.
//

import SwiftUI

struct CardReflectionView: View {
    @State var isDragging = false
    @State var translation: CGSize = .zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                translation = value.translation
                isDragging = true
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    translation = .zero
                    isDragging = false
                }
            }
    }
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            overlayImage
        }
        .preferredColorScheme(.dark)
    }
    
    var gloss1: some View {
        Image("Gloss 1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .mask(
                LinearGradient(colors: [.clear, .white, .clear, .white, .clear, .white, .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(translation.height / 100+1), y: abs(translation.height / 100+1)))
                    .frame(width: 392)
            )
    }
    
    var gloss2: some View {
        Image("Gloss 2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .mask(
                LinearGradient(colors: [.clear, .white, .clear, .white, .clear, .white, .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(translation.height / 100+1), y: abs(translation.height / 100+1)))
                    .frame(width: 392)
            )
    }
    
    var logos: some View {
        ZStack {
            Image("Logo 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
                .offset(x: translation.width / 10, y: translation.height / 20)
            
            Image("Logo 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400)
                .offset(x: translation.width / 12, y: translation.height / 24)
            
            Image("Logo 3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 392, height: 600)
                .blendMode(.overlay)
                .offset(x: translation.width / 15, y: translation.height / 30)
        }
    }
    
    var overlayImage: some View {
        ZStack {
            Image("Background 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 600)
                .overlay {
                   logos
                }
                .overlay { gloss1.blendMode(.softLight) }
                .overlay { gloss2.blendMode(.luminosity) }
                .overlay { gloss2.blendMode(.overlay) }
                .overlay {
                    LinearGradient(colors: [.clear, .white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 50)
                        .strokeBorder(.linearGradient(colors: [.clear, .white.opacity(0.75), .clear, .white.opacity(0.75), .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(translation.height / 100+0.5), y: abs(translation.height / 100+1))))
                }
                .overlay {
                    LinearGradient(colors: [Color(#colorLiteral(red: 0.4465706348, green: 0.2242571414, blue: 0.9763135314, alpha: 0.495343543)), Color(#colorLiteral(red: 0.2196078431, green: 0.007843137255, blue: 0.8549019608, alpha: 0.495343543))], startPoint: .topLeading, endPoint: UnitPoint(x: abs(translation.height / 100+0.5), y: abs(translation.height / 100+1)))
                        .blendMode(.overlay)
                }
                .cornerRadius(50)
                .background {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.black)
                        .offset(y: 50)
                        .blur(radius: 50)
                        .opacity(0.5)
                        .blendMode(.overlay)
                    
                }
                .scaleEffect(0.9)
                .rotation3DEffect(.degrees(isDragging ? 5 : 0), axis: (x: -translation.height, y: translation.width, z: 0))
                .gesture(drag)
        }
    }
}

struct CardReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        CardReflectionView()
    }
}
