//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Emili Sharpinska on 25/06/2026.
//

import Foundation
import Combine

class CoinDataService: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    
    init(){
        getCoins()
    }
    
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output -> Data in
                guard let responce = output.response as? HTTPURLResponse,
                      responce.statusCode >= 200 && responce.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
        
    }
}
