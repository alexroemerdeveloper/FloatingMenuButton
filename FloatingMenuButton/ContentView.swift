//
//  ContentView.swift
//  FloatingMenuButton
//
//  Created by Alexander Römer on 20.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var open = false
    
    var body: some View {
        ZStack {
            
            Button(action: {
                self.open.toggle()
            }) {
                Image(systemName: "plus")
                    .rotationEffect(.degrees(open ? 45 : 0))
                    .foregroundColor(.white)
                    .font(.system(size: 38, weight: .bold))
                    .animation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0))
            }
            .padding(24)
            .background(Color.pink)
            .mask(Circle())
            .shadow(color: Color.pink, radius: 10)
            .zIndex(10)
            
            SecondButton(open: $open, icon: "bubble.left.fill", color: .blue, offsetY: -90)
            SecondButton(open: $open, icon: "trash", color: .green, offsetX: -60, offsetY: -60, delay: 0.2)
            SecondButton(open: $open, icon: "pencil", color: .purple, offsetX: -90, delay: 0.4)
            SecondButton(open: $open, icon: "folder", color: .orange, offsetX: -60, offsetY: 60, delay: 0.6)
            SecondButton(open: $open, icon: "person", color: .red, offsetX: 0, offsetY: 90, delay: 0.8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SecondButton: View {
    @Binding var open: Bool
    
    var icon    = "pencil"
    var color   = Color.blue
    var offsetX = 0
    var offsetY = 0
    var delay   = 0.0
    
    var body: some View {
        Button(action: {
            // do some action
        }) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
        }
        .padding()
        .background(color)
        .mask(Circle())
        .offset(x: open ? CGFloat(offsetX) : 0, y: open ? CGFloat(offsetY) : 0)
        .scaleEffect(open ? 1 : 0)
        .animation(Animation.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0).delay(Double(delay)))
    }

}
