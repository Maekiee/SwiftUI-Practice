import SwiftUI


// 상품 모델
struct Product: Identifiable {
    let id = UUID()
    let brand: String
    let name: String
    let price: Int
    let imageName: String
}

struct ShoppingTabView: View {
    // 탭 아이템
    let tabs = ["FC서울x엔마카", "추천", "신상", "패딩", "부티", "랭킹", "발매정보"]
    @State private var selectedTab = "신상"
    
    // 샘플 상품 데이터
    let products = [
        Product(brand: "Palace", name: "팔라스 퍼텍스 퀼팅 RS…", price: 930000, imageName: "jacket1"),
        Product(brand: "moif", name: "[더블점핑][FW25] 모…", price: 567000, imageName: "jacket2"),
        Product(brand: "Jordan", name: "조던 1 x 자이언 윌리엄…", price: 210000, imageName: "shoe1"),
        Product(brand: "Polyteru Human In...", name: "폴리테루 휴먼인텍스 츄…", price: 164000, imageName: "pants1"),
        Product(brand: "Palace", name: "팔라스 퍼텍스 퀼팅 RS…", price: 840000, imageName: "jacket3"),
        Product(brand: "moif", name: "[더블점핑][FW25] 모…", price: 567000, imageName: "jacket4"),
        Product(brand: "IAB Studio", name: "아이앱 스튜디오 아이앱…", price: 166000, imageName: "hoodie1"),
        Product(brand: "moif", name: "[더블점핑][FW25] 모…", price: 495000, imageName: "jacket5"),
        Product(brand: "Nike", name: "(W) 나이키 아스트로그…", price: 138000, imageName: "shoe2"),
        Product(brand: "Polyteru", name: "폴리테루 팬츠…", price: 164000, imageName: "pants2"),
        Product(brand: "Nike", name: "나이키 신발…", price: 200000, imageName: "shoe3"),
        Product(brand: "Palace", name: "팔라스 재킷…", price: 750000, imageName: "jacket6")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // 탭 바
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack(spacing: 8) {
                            HStack(spacing: 4) {
                                Text(tab)
                                    .font(.system(size: 16, weight: selectedTab == tab ? .semibold : .regular))
                                    .foregroundColor(selectedTab == tab ? .black : .gray)
                                
                                // 빨간 점 표시 (패딩, 부티, 랭킹, 발매정보)
                                if ["패딩", "부티", "랭킹", "발매정보"].contains(tab) {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 6, height: 6)
                                        .offset(y: -4)
                                }
                            }
                            
                            // 선택된 탭 밑줄
                            if selectedTab == tab {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(height: 2)
                            } else {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(height: 2)
                            }
                        }
                        .onTapGesture {
                            selectedTab = tab
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 12)
            
            Divider()
            
            // 메인 컨텐츠
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // 제목
                    Text("일간 신상 랭킹")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    
                    // 상품 그리드
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(products) { product in
                            ProductCard(product: product)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

// 상품 카드
struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 상품 이미지
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(12)
                
                // 실제 앱에서는 이미지를 표시
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray.opacity(0.5))
            }
            
            // 브랜드명
            Text(product.brand)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.black)
            
            // 상품명
            Text(product.name)
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .lineLimit(1)
            
            // 가격
            Text("\(product.price.formatted())원")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    ShoppingTabView()
}
