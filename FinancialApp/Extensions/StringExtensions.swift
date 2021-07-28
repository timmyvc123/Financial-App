//
//  Extensions.swift
//  FinancialApp
//
//  Created by Timmy Van Cauwenberge on 7/27/21.
//

import Foundation

extension String {
    
    func addBrackets() -> String {
        return "(\(self))"
    }
    
    func prefix(withText text: String) -> String {
        return text + self
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
    
}
