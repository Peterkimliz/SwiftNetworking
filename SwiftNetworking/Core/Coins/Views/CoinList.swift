//
//  ContentView.swift
//  SwiftNetworking
//
//  Created by Apple on 01/09/2026.
//

import SwiftUI

struct CoinList: View {
    @State var coinvm:CoinsViewModel = CoinsViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(coinvm.coins) { coin in
                    HStack{
                        AsyncImage(url: URL(string:coin.image)) { image in
                            image.resizable()
                                .frame(width: 50,height: 50)
                                .clipShape(Circle())
                            
                        } placeholder: {
                            ProgressView()
                                .frame(width: 50, height: 50)
                            
                        }
                        
                        
                        
                        VStack(
                            alignment: .leading
                        ){
                            Text(coin.name)
                                .bold()
                            
                            Text(coin.symbol)
                                .font(.caption)
                        }
                    }
                }
            }
            .alert("\(coinvm.errors.errorMessage)", isPresented:$coinvm.errors.hasError, actions: {
                
            })
            
            

            .overlay{
                if  coinvm.isLoadingCoins{
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            }
            .navigationTitle("Coins")
            .listStyle(.plain)
            .task {
                await coinvm.fetchCoins()
            }
        }
        
    }
}

#Preview {
    CoinList()
}
