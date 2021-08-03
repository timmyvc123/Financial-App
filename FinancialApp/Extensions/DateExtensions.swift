//
//  DateExtension.swift
//  FinancialApp
//
//  Created by Timmy Van Cauwenberge on 7/29/21.
//

import Foundation

extension Date {
    
    var MMYYFormat: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
        
    }
}
