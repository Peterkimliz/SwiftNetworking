//
//  CoinsViewModel.swift
//  SwiftNetworking
//
//  Created by Apple on 01/09/2026.
//

import SwiftUI

@Observable
class CoinsViewModel {
    
    let coinService:CoinService
    var coins = [Coin]()
    var isLoadingCoins = false
    var errors:(hasError:Bool,errorMessage:String) = (false,"")
    
    init(coinService: CoinService = CoinServiceImpl.shared) {
        self.coinService = coinService
    }
    
    
    
    func fetchCoins()async{
        isLoadingCoins = true
        defer{
            isLoadingCoins = false
        }
        
        do{
           let data = try await coinService.fetchCoins()
           coins = data
        }catch let error as ApiErrors {
            errors.errorMessage = error.description
            errors.hasError = true
            print("Error has occurred \(error.description)")
            
        }catch {
            errors.errorMessage = error.localizedDescription
            errors.hasError = true
            print("An unexpected error occurred: \(error)")
        }
        
    }
    
    
        
}


