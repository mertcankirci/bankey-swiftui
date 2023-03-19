//
//  CryptoView.swift
//  Bankey-SwiftUI
//
//  Created by Mertcan Kırcı on 6.03.2023.
//

import SwiftUI

struct CryptoView: View {
    
    @EnvironmentObject var service: NetworkService
    @State private var searchText : String = ""
    
    
    var body: some View {
        
            VStack(alignment: .center) {
                ZStack {
                    LinearGradient(
                        colors: [Color(hex: 0x22A39F), .black],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                    ScrollView {
                    VStack(alignment: .center, spacing: 10) {
                        SearchBar(text: $searchText)
                        
                        ForEach(service.cryptos.filter {
                            searchText.isEmpty ? true : ($0.currency + " " + $0.price).lowercased().contains(searchText.lowercased())
                        }, id:\.self) { coin in
                            HStack{
                                Text(coin.currency)
                                    .foregroundColor(.white)
                                    .font(.footnote)
                                Text("----->")
                                    .foregroundColor(.white)
                                Text(coin.price)
                                    .foregroundColor(.white)
                                    .font(.footnote)
                            }
                            
                        }
                        
                        //                    Button("ASD") {
                        //                        print(service.cryptos)
                        //
                        //                    }
                    }
                }
            }
        }
        .onAppear {
            service.feth()
        }
    }
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView()
            .environmentObject(NetworkService())
    }
}
