//
//  Coin.swift
//  SwiftNetworking
//
//  Created by Apple on 01/09/2026.
//

import SwiftUI


struct Coin: Codable,Identifiable{
    let id:String
    let symbol:String
    let name:String
    let image:String
    let marketCap:Int
    let currentPrice:Double
    
    enum CodingKeys:String,CodingKey{
        case id, symbol,name,image
        case marketCap = "market_cap"
        case currentPrice = "current_price"
    }
    
    
}

