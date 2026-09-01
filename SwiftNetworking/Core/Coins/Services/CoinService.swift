//
//  CoinService.swift
//  SwiftNetworking
//  Created by Apple on 01/09/2026.

import SwiftUI


protocol  CoinService{
    static var shared:CoinService{ get}
    func fetchCoins()async throws->[Coin]
}

class CoinServiceImpl:CoinService {
    
    static let shared: CoinService = CoinServiceImpl()
    private init(){}
    
    let baseUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
    
    
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: baseUrl) else{
            throw ApiErrors.invalidUrl
        }
        do{
            let (data,response) = try await URLSession.shared.data(from:url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw ApiErrors.invalidHttpResponse
            }
            
            let coindData = try JSONDecoder().decode([Coin].self,from: data)
    
            return coindData
        }catch{
            throw ApiErrors.unknownError(desc: error.localizedDescription)
        }
        
        
        
    }
    
    
    
    
    
    
    
    
}

