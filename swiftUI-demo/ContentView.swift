//
//  ContentView.swift
//  swiftUI-demo
//
//  Created by Innei on 5/3/2020.
//  Copyright © 2020 Innei. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    Text("Certificates")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
                }
                Image("Illustration5")
                
                Spacer()
            }.padding()
            
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
            
            CardView()
                .offset(x: 0, y: -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: 15))
                .rotation3DEffect(Angle(degrees: 50), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
            
            CardView()
                .offset(x: 0, y: -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: 10))
                .rotation3DEffect(Angle(degrees: 40), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.softLight)
            
            CardView()
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: 5))
                .rotation3DEffect(Angle(degrees: 30), axis: (x: 10.0, y: 10.0, z: 10.0))
            
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
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}
