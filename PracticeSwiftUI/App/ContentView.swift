import SwiftUI

struct ContentView: View {
    @State private var foodCount = 0
    @State private var waterCount = 0
    
    @State private var feedText = ""
    @State private var waterText = ""
    
    private let categories = ["로맨스", "액션", "판타지", "호러", "코미디", "드라마"]
    
    @State private var selectItemText = ""
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(categories, id: \.self) { item in
                        Button {
                            selectItemText = item
                        } label: {
                            Text(item)
                        }
                        .padding()
                        .background(.green)

                    }
                }
            }
            
            
            Text(selectItemText)
           
            
            HStack {
                Text("밥알: \(foodCount)개")
                Text("물방울: \(waterCount)개")
            }
            
            HStack {
                TextField("밥알 갯수", text: $feedText)
                CountingButton(
                    title: "밥먹기",
                    totalCount: $foodCount,
                    inputText: $feedText)
//                CustomButton(title: "밥먹기") {
//                    foodIncreasae()
//                }
            }
            .padding(.horizontal, 60)
            
            HStack {
                TextField("물방울 갯수", text: $waterText)
                CountingButton(
                    title: "물먹기",
                    totalCount: $waterCount,
                    inputText: $waterText)
//                CustomButton(title: "물먹기") {
//                    waterIncreasae()
//                }
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

struct CountingButton: View {
    var title: String
    
    @Binding var totalCount: Int
    @Binding var inputText: String
    
    var body: some View {
        Button(title) {
            if let amount = Int(inputText) {
                totalCount += amount
            } else {
                totalCount += 1
            }
            inputText = ""
        }
        .padding()
        .border(.gray, width: 1)
        
    }
}

struct CustomButton: View {
    var title: String
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
