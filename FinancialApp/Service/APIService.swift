//
//  APIService.swift
//  FinancialApp
//
//  Created by Timmy Van Cauwenberge on 7/9/21.
//

import Foundation
import Combine

struct APIService {
    
    //select random key (bc API only allows 5 calls per min per key)
    let keys = ["NYIBW5OFD6LOHB94", "9ZQ1GB630TDTSBU4", "KD3ILYR03028IZX7"]
    
    var API_KEY: String {
        return keys.randomElement() ?? ""
    }
    
    func fetchSymbolsPublisher(keywords: String) -> AnyPublisher<SearchResults, Error> {
        
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(API_KEY)"
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: SearchResults.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
 
    
}
