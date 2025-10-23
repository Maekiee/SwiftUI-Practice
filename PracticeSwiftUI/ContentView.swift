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
                CustomButton(title: "밥먹기") {
                    foodIncreasae()
                }
            }
            .padding(.horizontal, 60)
            
            HStack {
                TextField("물방울 갯수", text: $waterText)
                CustomButton(title: "물먹기") {
                    waterIncreasae()
                }
            }
            .padding(.horizontal, 60)
        }
    }
    
    private func foodIncreasae() {
        if let amount = Int(feedText) {
            foodCount += amount
        } else {
            foodCount += 1
        }
        feedText = ""
    }

    private func waterIncreasae() {
        if let amount = Int(waterText) {
            waterCount += amount
        } else {
            waterCount += 1
        }
        waterText = ""
    }
}

struct CustomButton: View {
    var title: String
//    @Binding var count: String
    let action: () -> Void
    
    var body: some View {
        Button(title) {
            action()
        }
        .padding()
        .border(.gray, width: 1)
        
    }
    
}

#Preview {
    ContentView()
}
