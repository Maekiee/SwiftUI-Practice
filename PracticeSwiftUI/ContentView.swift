//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by 박도원 on 10/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var foodCount = 0
    @State private var waterCount = 0
    
    @State private var feedText = ""
    @State private var waterText = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("밥알: \(foodCount)개")
                Text("물방울: \(waterCount)개")
            }
            HStack {
                TextField("밥알 갯수", text: $feedText)
                CustomButton(title: "밥먹기", count: $foodCount)
            }
            .padding(.horizontal, 60)
            HStack {
                TextField("물방울 갯수", text: $waterText)
                CustomButton(title: "물먹기", count: $waterCount)
            }
            .padding(.horizontal, 60)
        }
    }
}

struct CustomButton: View {
    var title: String
    @Binding var count: Int
    
    var body: some View {
        Button(title) {
            count += 1
        }
        .padding()
        .border(.gray, width: 1)
        
    }
    
}

#Preview {
    ContentView()
}
