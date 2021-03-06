//
//  Home.swift
//  swiftUI-demo
//
//  Created by Innei on 5/3/2020.
//  Copyright © 2020 Innei. All rights reserved.
//

import SwiftUI

struct Home: View {
    //    var menuItems = ["My Account", "Billing", "Term", "Sign out"]
    @State var show = false
    var body: some View {
        ZStack {
            MenuButton(show: $show)
            
            MenuRight(show: $show)
            // use binding data add prefix $ to var
            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32,height: 32)
            
            Text(text)
                .font(.headline)
            
            Spacer()
        }
    }
}

struct Menu : Identifiable {
    var id = UUID()
    var title: String
    var icon : String
}


let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct MenuView: View {
    var menu = menuData
    @Binding var show : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
                
            }
            Spacer()
        }
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 10, y: 10, z: 10))
        .animation(.default)
        .offset(x: !show ? -UIScreen.main.bounds.width : 0)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    var icon: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 40, height: 40)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show : Bool
    var body: some View {
        ZStack(alignment: .topLeading){
            Button(action: { self.show.toggle() }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct MenuRight: View {
    @Binding var show : Bool
    var body: some View {
        ZStack(alignment: .topTrailing){
            HStack {
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle.fill")
                }
                
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "bell")
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing).padding(.trailing)
    }
}
