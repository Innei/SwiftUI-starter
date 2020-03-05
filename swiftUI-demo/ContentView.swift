//
//  ContentView.swift
//  swiftUI-demo
//
//  Created by Innei on 5/3/2020.
//  Copyright © 2020 Innei. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            TitleView().blur(radius: show ? 20: 0).animation(.default)
            
            
            CardBottonView().blur(radius: show ? 20 : 0).animation(.default)
            
            CardView()
                .background(show ? Color("background8") : Color.purple)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -80 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .offset(x: viewState.width, y: viewState.height)
                .animation(Animation.easeInOut(duration: 0.7))
                .blendMode(.hardLight)
            
            
            
            CardView()
                .background(show ? Color.red : Color("background8"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -40 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
                .animation(Animation.easeInOut(duration: 0.5))
            
            
            CardView()
                .background(Color.black)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5: 0))
                //                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
            }
            .gesture(DragGesture()
            .onChanged{ value in
                self.viewState = value.translation
                self.show = true
            }
            .onEnded{
                value in
                self.viewState = CGSize.zero
                self.show = false
                }
            )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.headline)
                        .foregroundColor(Color("accent"))
                        .fontWeight(.bold)
                        .padding(.top)
                    Text("certificate")
                        .foregroundColor(.white)
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0,height: 30.0)
            }
            .padding(.horizontal)
            Spacer()
            Image("Background")
        }
        .frame(width: 340.0, height: 220.0)
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            
            Spacer()
        }
        .padding()
    }
}

struct CardBottonView: View {
    var body: some View {
        VStack(spacing: 20){
            Rectangle().frame(width: 60,height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .lineLimit(10)
            
            Spacer()
        }
        .frame(minWidth: 0,maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 600)
    }
}
